    .section .data

	.global gUnknown_089A398C
gUnknown_089A398C:  @ 0x089A398C
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807CE18
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807CE78
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807D09C
        @ PROC_SLEEP
        .short 0xe, 0x14
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807DA2C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A39C4
gUnknown_089A39C4:  @ 0x089A39C4
@ replacing .incbin "baserom.gba", 0x009a39c4, 0x1c
.4byte gUnknown_089B80C4 + 0x20
.4byte gUnknown_089B80C4 + 0x7c
.4byte gUnknown_089B80C4 + 0xe0
.4byte gUnknown_089B80C4 + 0x150
.4byte gUnknown_089B80C4 + 0x1c8
.4byte gUnknown_089B80C4 + 0x22c
.4byte gUnknown_089B80C4 + 0x298

	.global gUnknown_089A39E0
gUnknown_089A39E0:  @ 0x089A39E0
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807D0FC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807D1B4
        @ PROC_START_CHILD_BLOCKING
        .short 0x6, 0x1
        .word gUnknown_089A3A28
        @ PROC_SLEEP
        .short 0xe, 0x3c
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807DA2C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A3A18
gUnknown_089A3A18:  @ 0x089A3A18
	.incbin "baserom.gba", 0x9A3A18, 0x10

	.global gUnknown_089A3A28
gUnknown_089A3A28:  @ 0x089A3A28
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807D2E0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807D328
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_089A3A40
gUnknown_089A3A40:  @ 0x089A3A40
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_807D39C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807D3B4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807D3CC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807D40C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807D440
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807D464
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A3A80
gUnknown_089A3A80:  @ 0x089A3A80
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807D51C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807D57C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807D670
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807DA2C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A3AB8
gUnknown_089A3AB8:  @ 0x089A3AB8
@ replacing .incbin "baserom.gba", 0x009a3ab8, 0x84
.4byte gUnknown_089B4BFC + 0x20
.4byte gUnknown_089B4BFC + 0x84
.4byte gUnknown_089B4BFC + 0xec
.4byte gUnknown_089B4BFC + 0x168
.4byte gUnknown_089B4BFC + 0x1e0
.4byte gUnknown_089B4BFC + 0x250
.4byte gUnknown_089B4BFC + 0x2bc
.4byte gUnknown_089B4BFC + 0x330
.4byte gUnknown_089B4BFC + 0x3a8
.4byte gUnknown_089B4BFC + 0x420
.4byte gUnknown_089B4BFC + 0x498
.4byte gUnknown_089B4BFC + 0x51c
.4byte gUnknown_089B4BFC + 0x5a0
.4byte gUnknown_089B4BFC + 0x624
.4byte gUnknown_089B4BFC + 0x6a8
.4byte gUnknown_089B4BFC + 0x714
.4byte gUnknown_089B4BFC + 0x79c
.4byte gUnknown_089B4BFC + 0x838
.4byte gUnknown_089B4BFC + 0x8f4
.4byte gUnknown_089B4BFC + 0x9f0
.4byte gUnknown_089B4BFC + 0xb24
.4byte gUnknown_089B4BFC + 0xce0
.4byte gUnknown_089B4BFC + 0xf3c
.4byte gUnknown_089B4BFC + 0x1070
.4byte gUnknown_089B4BFC + 0x1210
.4byte gUnknown_089B4BFC + 0x1454
.4byte gUnknown_089B4BFC + 0x1578
.4byte gUnknown_089B4BFC + 0x1710
.4byte gUnknown_089B4BFC + 0x1914
.4byte gUnknown_089B4BFC + 0x19d8
.4byte gUnknown_089B4BFC + 0x1ac0
.4byte gUnknown_089B4BFC + 0x1c0c
.4byte gUnknown_089B4BFC + 0x1dc0

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
        .word sub_807DA2C
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
        .word sub_807DA2C
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
        .word sub_807DA2C
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
        .word sub_807DA2C
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
        .word sub_807DA2C
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
        .word sub_807DA2C
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
        .word sub_807DA2C
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
        .word sub_807DA2C
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
        .word sub_807DA2C
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
        .word sub_807DA2C
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


	.global gUnknown_089A3ED4
gUnknown_089A3ED4:  @ 0x089A3ED4
@ Replacing .incbin "baserom.gba", 0x9A3ED4, 0x78
    .4byte 0x00000009
    .4byte gMid_Lv
    .4byte gMid_Lv
    .4byte 0x00000401
    .4byte gMid_Hp
    .4byte gMid_Hp
    .4byte 0x00000601
    .4byte gMid_Str
    .4byte gMid_Mag
    .4byte 0x00000801
    .4byte gMid_Skl
    .4byte gMid_Skl
    .4byte 0x00000a01
    .4byte gMid_Spd
    .4byte gMid_Spd
    .4byte 0x00000409
    .4byte gMid_Lck
    .4byte gMid_Lck
    .4byte 0x00000609
    .4byte gMid_Def
    .4byte gMid_Def
    .4byte 0x00000809
    .4byte gMid_Res
    .4byte gMid_Res
    .4byte 0x00000a09
    .4byte gMid_Con
    .4byte gMid_Con
    .4byte 0x0000ffff
    .4byte 0x00000000
    .4byte 0x00000000

	.global gUnknown_089A3F4C
gUnknown_089A3F4C:  @ 0x089A3F4C
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_807EDEC
        @ PROC_BLOCK
        .short 0x10, 0x0
        .word 0x0

	.global gUnknown_089A3F5C
gUnknown_089A3F5C:  @ 0x089A3F5C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807F2B4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807F2BC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_089A3F74
gUnknown_089A3F74:  @ 0x089A3F74
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_807F55C
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807F124
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807F478
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807F48C
        @ PROC_SLEEP
        .short 0xe, 0x46
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807F53C
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807F548
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807F1AC
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807F30C
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807F39C
        @ PROC_SLEEP
        .short 0xe, 0x3c
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807EE74
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807F354
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807F190
        @ PROC_CALL
        .short 0x2, 0x0
        .word ResetDialogueScreen
        @ PROC_SLEEP
        .short 0xe, 0x4
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A4034
gUnknown_089A4034:  @ 0x089A4034
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807F58C
        @ PROC_SLEEP
        .short 0xe, 0xf
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A404C
gUnknown_089A404C:  @ 0x089A404C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807F5EC
        @ PROC_SLEEP
        .short 0xe, 0x10
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A4064
gUnknown_089A4064:  @ 0x089A4064
        @ PROC_CALL
        .short 0x2, 0x0
        .word BG0Shaker_Init
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word BG0Shaker_Loop
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A407C
gUnknown_089A407C:  @ 0x089A407C
        @ PROC_CALL
        .short 0x2, 0x0
        .word AddSkipThread2
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807F758
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807F788
        @ PROC_CALL
        .short 0x2, 0x0
        .word SubSkipThread2
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A40AC
gUnknown_089A40AC:  @ 0x089A40AC
@ replacing .incbin "baserom.gba", 0x009a40ac, 0x4
.4byte gUnknown_089B80C4 + 0x2fc

	.global gUnknown_089A40B0
gUnknown_089A40B0:  @ 0x089A40B0
@ replacing .incbin "baserom.gba", 0x009a40b0, 0xec
.4byte gUnknown_089B80C4 + 0x1a314
.4byte gUnknown_089B80C4 + 0x1aa14
.4byte gUnknown_089B80C4 + 0x900
.4byte gUnknown_089B80C4 + 0x1a334
.4byte gUnknown_089B80C4 + 0x1ab6c
.4byte gUnknown_089B80C4 + 0x1014
.4byte gUnknown_089B80C4 + 0x1a354
.4byte gUnknown_089B80C4 + 0x1acfc
.4byte gUnknown_089B80C4 + 0x1818
.4byte gUnknown_089B80C4 + 0x1a374
.4byte gUnknown_089B80C4 + 0x1aeb4
.4byte gUnknown_089B80C4 + 0x20cc
.4byte gUnknown_089B80C4 + 0x1a394
.4byte gUnknown_089B80C4 + 0x1b06c
.4byte gUnknown_089B80C4 + 0x2914
.4byte gUnknown_089B80C4 + 0x1a3b4
.4byte gUnknown_089B80C4 + 0x1b214
.4byte gUnknown_089B80C4 + 0x3204
.4byte gUnknown_089B80C4 + 0x1a3d4
.4byte gUnknown_089B80C4 + 0x1b3dc
.4byte gUnknown_089B80C4 + 0x3ca4
.4byte gUnknown_089B80C4 + 0x1a3f4
.4byte gUnknown_089B80C4 + 0x1b5ec
.4byte gUnknown_089B80C4 + 0x47c0
.4byte gUnknown_089B80C4 + 0x1a414
.4byte gUnknown_089B80C4 + 0x1b808
.4byte gUnknown_089B80C4 + 0x52f0
.4byte gUnknown_089B80C4 + 0x1a434
.4byte gUnknown_089B80C4 + 0x1ba10
.4byte gUnknown_089B80C4 + 0x5e24
.4byte gUnknown_089B80C4 + 0x1a454
.4byte gUnknown_089B80C4 + 0x1bc34
.4byte gUnknown_089B80C4 + 0x69cc
.4byte gUnknown_089B80C4 + 0x1a474
.4byte gUnknown_089B80C4 + 0x1be5c
.4byte gUnknown_089B80C4 + 0x7538
.4byte gUnknown_089B80C4 + 0x1a494
.4byte gUnknown_089B80C4 + 0x1c08c
.4byte gUnknown_089B80C4 + 0x7ea0
.4byte gUnknown_089B80C4 + 0x1a4b4
.4byte gUnknown_089B80C4 + 0x1c268
.4byte gUnknown_089B80C4 + 0x87fc
.4byte gUnknown_089B80C4 + 0x1a4d4
.4byte gUnknown_089B80C4 + 0x1c43c
.4byte gUnknown_089B80C4 + 0x90cc
.4byte gUnknown_089B80C4 + 0x1a4f4
.4byte gUnknown_089B80C4 + 0x1c600
.4byte gUnknown_089B80C4 + 0x9ae4
.4byte gUnknown_089B80C4 + 0x1a514
.4byte gUnknown_089B80C4 + 0x1c7e8
.4byte gUnknown_089B80C4 + 0xa3b8
.4byte gUnknown_089B80C4 + 0x1a534
.4byte gUnknown_089B80C4 + 0x1c99c
.4byte gUnknown_089B80C4 + 0xab2c
.4byte gUnknown_089B80C4 + 0x1a554
.4byte gUnknown_089B80C4 + 0x1cb38
.4byte gUnknown_089B80C4 + 0xb1e0
.4byte gUnknown_089B80C4 + 0x1a574
.4byte gUnknown_089B80C4 + 0x1ccb0

	.global gUnknown_089A419C
gUnknown_089A419C:  @ 0x089A419C
@ replacing .incbin "baserom.gba", 0x009a419c, 0x120
.4byte gUnknown_089B80C4 + 0xb8e4
.4byte gUnknown_089B80C4 + 0x1a594
.4byte gUnknown_089B80C4 + 0x1ce08
.4byte gUnknown_089B80C4 + 0xbe24
.4byte gUnknown_089B80C4 + 0x1a5b4
.4byte gUnknown_089B80C4 + 0x1cf18
.4byte gUnknown_089B80C4 + 0xc3b8
.4byte gUnknown_089B80C4 + 0x1a5d4
.4byte gUnknown_089B80C4 + 0x1d03c
.4byte gUnknown_089B80C4 + 0xc770
.4byte gUnknown_089B80C4 + 0x1a5f4
.4byte gUnknown_089B80C4 + 0x1d150
.4byte gUnknown_089B80C4 + 0xc81c
.4byte gUnknown_089B80C4 + 0x1a614
.4byte gUnknown_089B80C4 + 0x1d20c
.4byte gUnknown_089B80C4 + 0xc898
.4byte gUnknown_089B80C4 + 0x1a634
.4byte gUnknown_089B80C4 + 0x1d2c8
.4byte gUnknown_089B80C4 + 0xc908
.4byte gUnknown_089B80C4 + 0x1a654
.4byte gUnknown_089B80C4 + 0x1d37c
.4byte gUnknown_089B80C4 + 0xcd74
.4byte gUnknown_089B80C4 + 0x1a674
.4byte gUnknown_089B80C4 + 0x1d47c
.4byte gUnknown_089B80C4 + 0xd264
.4byte gUnknown_089B80C4 + 0x1a694
.4byte gUnknown_089B80C4 + 0x1d594
.4byte gUnknown_089B80C4 + 0xd5b0
.4byte gUnknown_089B80C4 + 0x1a6b4
.4byte gUnknown_089B80C4 + 0x1d6a0
.4byte gUnknown_089B80C4 + 0xd670
.4byte gUnknown_089B80C4 + 0x1a6d4
.4byte gUnknown_089B80C4 + 0x1d75c
.4byte gUnknown_089B80C4 + 0xd714
.4byte gUnknown_089B80C4 + 0x1a6f4
.4byte gUnknown_089B80C4 + 0x1d81c
.4byte gUnknown_089B80C4 + 0xdeac
.4byte gUnknown_089B80C4 + 0x1a714
.4byte gUnknown_089B80C4 + 0x1d95c
.4byte gUnknown_089B80C4 + 0xe528
.4byte gUnknown_089B80C4 + 0x1a734
.4byte gUnknown_089B80C4 + 0x1da94
.4byte gUnknown_089B80C4 + 0xe994
.4byte gUnknown_089B80C4 + 0x1a754
.4byte gUnknown_089B80C4 + 0x1dbcc
.4byte gUnknown_089B80C4 + 0xea5c
.4byte gUnknown_089B80C4 + 0x1a774
.4byte gUnknown_089B80C4 + 0x1dc88
.4byte gUnknown_089B80C4 + 0xf1b8
.4byte gUnknown_089B80C4 + 0x1a794
.4byte gUnknown_089B80C4 + 0x1ddd8
.4byte gUnknown_089B80C4 + 0xf968
.4byte gUnknown_089B80C4 + 0x1a7b4
.4byte gUnknown_089B80C4 + 0x1df2c
.4byte gUnknown_089B80C4 + 0x1037c
.4byte gUnknown_089B80C4 + 0x1a7d4
.4byte gUnknown_089B80C4 + 0x1e0ac
.4byte gUnknown_089B80C4 + 0x10d00
.4byte gUnknown_089B80C4 + 0x1a7f4
.4byte gUnknown_089B80C4 + 0x1e234
.4byte gUnknown_089B80C4 + 0x11980
.4byte gUnknown_089B80C4 + 0x1a814
.4byte gUnknown_089B80C4 + 0x1e428
.4byte gUnknown_089B80C4 + 0x12380
.4byte gUnknown_089B80C4 + 0x1a834
.4byte gUnknown_089B80C4 + 0x1e60c
.4byte gUnknown_089B80C4 + 0x1294c
.4byte gUnknown_089B80C4 + 0x1a854
.4byte gUnknown_089B80C4 + 0x1e730
.4byte gUnknown_089B80C4 + 0x136ec
.4byte gUnknown_089B80C4 + 0x1a874
.4byte gUnknown_089B80C4 + 0x1e9e0

	.global gUnknown_089A42BC
gUnknown_089A42BC:  @ 0x089A42BC
@ replacing .incbin "baserom.gba", 0x009a42bc, 0x90
.4byte gUnknown_089B80C4 + 0x14964
.4byte gUnknown_089B80C4 + 0x1a894
.4byte gUnknown_089B80C4 + 0x1ed58
.4byte gUnknown_089B80C4 + 0x14dc8
.4byte gUnknown_089B80C4 + 0x1a8b4
.4byte gUnknown_089B80C4 + 0x1ee48
.4byte gUnknown_089B80C4 + 0x1558c
.4byte gUnknown_089B80C4 + 0x1a8d4
.4byte gUnknown_089B80C4 + 0x1ef88
.4byte gUnknown_089B80C4 + 0x15f74
.4byte gUnknown_089B80C4 + 0x1a8f4
.4byte gUnknown_089B80C4 + 0x1f118
.4byte gUnknown_089B80C4 + 0x16ad0
.4byte gUnknown_089B80C4 + 0x1a914
.4byte gUnknown_089B80C4 + 0x1f2f0
.4byte gUnknown_089B80C4 + 0x176fc
.4byte gUnknown_089B80C4 + 0x1a934
.4byte gUnknown_089B80C4 + 0x1f4f8
.4byte gUnknown_089B80C4 + 0x182c8
.4byte gUnknown_089B80C4 + 0x1a954
.4byte gUnknown_089B80C4 + 0x1f708
.4byte gUnknown_089B80C4 + 0x18d44
.4byte gUnknown_089B80C4 + 0x1a974
.4byte gUnknown_089B80C4 + 0x1f8f0
.4byte gUnknown_089B80C4 + 0x19584
.4byte gUnknown_089B80C4 + 0x1a994
.4byte gUnknown_089B80C4 + 0x1fab4
.4byte gUnknown_089B80C4 + 0x19be0
.4byte gUnknown_089B80C4 + 0x1a9b4
.4byte gUnknown_089B80C4 + 0x1fc40
.4byte gUnknown_089B80C4 + 0x1a01c
.4byte gUnknown_089B80C4 + 0x1a9d4
.4byte gUnknown_089B80C4 + 0x1fd84
.4byte gUnknown_089B80C4 + 0x1a248
.4byte gUnknown_089B80C4 + 0x1a9f4
.4byte gUnknown_089B80C4 + 0x1fe84

	.global gUnknown_089A434C
gUnknown_089A434C:  @ 0x089A434C
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807F89C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807F964
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807FAA0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807FBCC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807FC58
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807FCA8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A4394
gUnknown_089A4394:  @ 0x089A4394
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807FCE4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807FDC8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807FE0C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807FFF0
        @ PROC_SLEEP
        .short 0xe, 0x3c
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807DA2C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A43D4
gUnknown_089A43D4:  @ 0x089A43D4
@ replacing .incbin "baserom.gba", 0x009a43d4, 0x4
.4byte gUnknown_089B80C4 + 0x1ff4c

	.global gUnknown_089A43D8
gUnknown_089A43D8:  @ 0x089A43D8
@ replacing .incbin "baserom.gba", 0x009a43d8, 0x5c
.4byte gUnknown_089B80C4 + 0x24c84
.4byte gUnknown_089B80C4 + 0x24d84
.4byte gUnknown_089B80C4 + 0x200d4
.4byte gUnknown_089B80C4 + 0x24ca4
.4byte gUnknown_089B80C4 + 0x24e4c
.4byte gUnknown_089B80C4 + 0x203e4
.4byte gUnknown_089B80C4 + 0x24cc4
.4byte gUnknown_089B80C4 + 0x24f38
.4byte gUnknown_089B80C4 + 0x2084c
.4byte gUnknown_089B80C4 + 0x24ce4
.4byte gUnknown_089B80C4 + 0x25050
.4byte gUnknown_089B80C4 + 0x21198
.4byte gUnknown_089B80C4 + 0x24d04
.4byte gUnknown_089B80C4 + 0x251c0
.4byte gUnknown_089B80C4 + 0x22348
.4byte gUnknown_089B80C4 + 0x24d24
.4byte gUnknown_089B80C4 + 0x25424
.4byte gUnknown_089B80C4 + 0x230dc
.4byte gUnknown_089B80C4 + 0x24d44
.4byte gUnknown_089B80C4 + 0x256cc
.4byte gUnknown_089B80C4 + 0x23f1c
.4byte gUnknown_089B80C4 + 0x24d64
.4byte gUnknown_089B80C4 + 0x259a4

	.global gUnknown_089A4434
gUnknown_089A4434:  @ 0x089A4434
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8080038
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8080050
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8080138
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8080288
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_808038C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80803D8
        @ PROC_SLEEP
        .short 0xe, 0x3c
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807DA2C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A448C
gUnknown_089A448C:  @ 0x089A448C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_808044C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A44A4
gUnknown_089A44A4:  @ 0x089A44A4
@ replacing .incbin "baserom.gba", 0x009a44a4, 0x138
.4byte gUnknown_089B80C4 + 0x25dc8
.4byte gUnknown_089B80C4 + 0x2cbb8
.4byte gUnknown_089B80C4 + 0x2cef8
.4byte gUnknown_089B80C4 + 0x25e4c
.4byte gUnknown_089B80C4 + 0x2cbd8
.4byte gUnknown_089B80C4 + 0x2cfb0
.4byte gUnknown_089B80C4 + 0x25ed8
.4byte gUnknown_089B80C4 + 0x2cbf8
.4byte gUnknown_089B80C4 + 0x2d06c
.4byte gUnknown_089B80C4 + 0x25f6c
.4byte gUnknown_089B80C4 + 0x2cc18
.4byte gUnknown_089B80C4 + 0x2d128
.4byte gUnknown_089B80C4 + 0x25ff8
.4byte gUnknown_089B80C4 + 0x2cc38
.4byte gUnknown_089B80C4 + 0x2d1e8
.4byte gUnknown_089B80C4 + 0x26088
.4byte gUnknown_089B80C4 + 0x2cc58
.4byte gUnknown_089B80C4 + 0x2d2a0
.4byte gUnknown_089B80C4 + 0x26108
.4byte gUnknown_089B80C4 + 0x2cc78
.4byte gUnknown_089B80C4 + 0x2d358
.4byte gUnknown_089B80C4 + 0x2696c
.4byte gUnknown_089B80C4 + 0x2cc98
.4byte gUnknown_089B80C4 + 0x2d53c
.4byte gUnknown_089B80C4 + 0x273ac
.4byte gUnknown_089B80C4 + 0x2ccb8
.4byte gUnknown_089B80C4 + 0x2d750
.4byte gUnknown_089B80C4 + 0x27ecc
.4byte gUnknown_089B80C4 + 0x2ccd8
.4byte gUnknown_089B80C4 + 0x2d994
.4byte gUnknown_089B80C4 + 0x289f4
.4byte gUnknown_089B80C4 + 0x2ccf8
.4byte gUnknown_089B80C4 + 0x2dc44
.4byte gUnknown_089B80C4 + 0x293bc
.4byte gUnknown_089B80C4 + 0x2cd18
.4byte gUnknown_089B80C4 + 0x2df28
.4byte gUnknown_089B80C4 + 0x2a090
.4byte gUnknown_089B80C4 + 0x2cd38
.4byte gUnknown_089B80C4 + 0x2e1cc
.4byte gUnknown_089B80C4 + 0x2ab58
.4byte gUnknown_089B80C4 + 0x2cd58
.4byte gUnknown_089B80C4 + 0x2e40c
.4byte gUnknown_089B80C4 + 0x2b3e4
.4byte gUnknown_089B80C4 + 0x2cd78
.4byte gUnknown_089B80C4 + 0x2e5dc
.4byte gUnknown_089B80C4 + 0x2bac4
.4byte gUnknown_089B80C4 + 0x2cd98
.4byte gUnknown_089B80C4 + 0x2e744
.4byte gUnknown_089B80C4 + 0x2bf60
.4byte gUnknown_089B80C4 + 0x2cdb8
.4byte gUnknown_089B80C4 + 0x2e860
.4byte gUnknown_089B80C4 + 0x2c280
.4byte gUnknown_089B80C4 + 0x2cdd8
.4byte gUnknown_089B80C4 + 0x2e950
.4byte gUnknown_089B80C4 + 0x2c3f4
.4byte gUnknown_089B80C4 + 0x2cdf8
.4byte gUnknown_089B80C4 + 0x2ea20
.4byte gUnknown_089B80C4 + 0x2c50c
.4byte gUnknown_089B80C4 + 0x2ce18
.4byte gUnknown_089B80C4 + 0x2eaec
.4byte gUnknown_089B80C4 + 0x2c624
.4byte gUnknown_089B80C4 + 0x2ce38
.4byte gUnknown_089B80C4 + 0x2ebbc
.4byte gUnknown_089B80C4 + 0x2c708
.4byte gUnknown_089B80C4 + 0x2ce58
.4byte gUnknown_089B80C4 + 0x2ec8c
.4byte gUnknown_089B80C4 + 0x2c7fc
.4byte gUnknown_089B80C4 + 0x2ce78
.4byte gUnknown_089B80C4 + 0x2ed58
.4byte gUnknown_089B80C4 + 0x2c914
.4byte gUnknown_089B80C4 + 0x2ce98
.4byte gUnknown_089B80C4 + 0x2ee24
.4byte gUnknown_089B80C4 + 0x2ca28
.4byte gUnknown_089B80C4 + 0x2ceb8
.4byte gUnknown_089B80C4 + 0x2eef0
.4byte gUnknown_089B80C4 + 0x2cb04
.4byte gUnknown_089B80C4 + 0x2ced8
.4byte gUnknown_089B80C4 + 0x2efbc

	.global gUnknown_089A45DC
gUnknown_089A45DC:  @ 0x089A45DC
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8080654
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8080660
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8080730
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80807C8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8080890
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8080900
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80809D8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8080B18
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8080B84
        @ PROC_SLEEP
        .short 0xe, 0x3c
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807DA2C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A4644
gUnknown_089A4644:  @ 0x089A4644
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8080BA8
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8080BD8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A4664
gUnknown_089A4664:  @ 0x089A4664
@ replacing .incbin "baserom.gba", 0x009a4664, 0x48
.4byte gUnknown_089E7DEC + 0x20
.4byte gUnknown_089E7DEC + 0x40
.4byte gUnknown_089E7DEC + 0x64
.4byte gUnknown_089E7DEC + 0x8c
.4byte gUnknown_089E7DEC + 0xb4
.4byte gUnknown_089E7DEC + 0xe0
.4byte gUnknown_089E7DEC + 0x110
.4byte gUnknown_089E7DEC + 0x140
.4byte gUnknown_089E7DEC + 0x170
.4byte gUnknown_089E7DEC + 0x1a0
.4byte gUnknown_089E7DEC + 0x1d0
.4byte gUnknown_089E7DEC + 0x210
.4byte gUnknown_089E7DEC + 0x254
.4byte gUnknown_089E7DEC + 0x2a4
.4byte gUnknown_089E7DEC + 0x300
.4byte gUnknown_089E7DEC + 0x35c
.4byte gUnknown_089E7DEC + 0x3b8
.4byte gUnknown_089E7DEC + 0x414

	.global gUnknown_089A46AC
gUnknown_089A46AC:  @ 0x089A46AC
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8080D6C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8080DCC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8080E84
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807DA2C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A46DC
gUnknown_089A46DC:  @ 0x089A46DC
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8080EE4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8080F44
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081008
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807DA2C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A470C
gUnknown_089A470C:  @ 0x089A470C
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80811AC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081078
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8081100
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A4734
gUnknown_089A4734:  @ 0x089A4734
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80811EC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8081208
        @ PROC_CALL
        .short 0x2, 0x0
        .word nullsub_58
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807DA2C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_MapAnimDefaultItemEffect
ProcScr_MapAnimDefaultItemEffect:  @ 0x089A4764
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_BeginSubjectFastAnim
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveSubjectsTowardsTarget
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveSubjectsTowardsTarget
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveSubjectsTowardsTarget
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveSubjectsTowardsTarget
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveCameraOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_BeginRoundSpecificAnims
        @ PROC_SLEEP
        .short 0xe, 0x8
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word MapAnim_WaitForHPToEndChangingMaybe
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveSubjectsAwayFromTarget
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveSubjectsAwayFromTarget
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveSubjectsAwayFromTarget
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveSubjectsAwayFromTarget
        @ PROC_SLEEP
        .short 0xe, 0x14
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_089A481C
gUnknown_089A481C:  @ 0x089A481C
        @ PROC_CALL
        .short 0x2, 0x0
        .word DisableMapPaletteAnimations
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E48
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x1a
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081A08
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0xdc
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E54
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word ResetMapPaletteAnimations
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_089A489C
gUnknown_089A489C:  @ 0x089A489C
        @ PROC_CALL
        .short 0x2, 0x0
        .word DisableMapPaletteAnimations
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E48
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80819E8
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0xc8
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E54
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word ResetMapPaletteAnimations
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_089A4914
gUnknown_089A4914:  @ 0x089A4914
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081A28
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x46
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_089A495C
gUnknown_089A495C:  @ 0x089A495C
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081A54
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x46
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_089A49A4
gUnknown_089A49A4:  @ 0x089A49A4
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081A80
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_BeginRoundSpecificAnims
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word MapAnim_WaitForHPToEndChangingMaybe
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_089A49FC
gUnknown_089A49FC:  @ 0x089A49FC
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081B40
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_BeginRoundSpecificAnims
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word MapAnim_WaitForHPToEndChangingMaybe
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_089A4A54
gUnknown_089A4A54:  @ 0x089A4A54
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveCameraOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081AB0
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_BeginRoundSpecificAnims
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word MapAnim_WaitForHPToEndChangingMaybe
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_089A4ABC
gUnknown_089A4ABC:  @ 0x089A4ABC
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveCameraOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081AE0
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_BeginRoundSpecificAnims
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word MapAnim_WaitForHPToEndChangingMaybe
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_089A4B24
gUnknown_089A4B24:  @ 0x089A4B24
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveCameraOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081B10
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_BeginRoundSpecificAnims
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word MapAnim_WaitForHPToEndChangingMaybe
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_089A4B8C
gUnknown_089A4B8C:  @ 0x089A4B8C
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveCameraOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081AB0
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_BeginRoundSpecificAnims
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word MapAnim_WaitForHPToEndChangingMaybe
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_089A4BF4
gUnknown_089A4BF4:  @ 0x089A4BF4
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081BF8
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x64
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_089A4C3C
gUnknown_089A4C3C:  @ 0x089A4C3C
        @ PROC_CALL
        .short 0x2, 0x0
        .word DisableMapPaletteAnimations
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E48
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80815EC
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081C18
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x8c
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E54
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word ResetMapPaletteAnimations
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_089A4CC4
gUnknown_089A4CC4:  @ 0x089A4CC4
        @ PROC_CALL
        .short 0x2, 0x0
        .word DisableMapPaletteAnimations
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E48
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveCameraOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081C34
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x32
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_BeginRoundSpecificAnims
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word MapAnim_WaitForHPToEndChangingMaybe
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E54
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word ResetMapPaletteAnimations
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_089A4D64
gUnknown_089A4D64:  @ 0x089A4D64
        @ PROC_CALL
        .short 0x2, 0x0
        .word DisableMapPaletteAnimations
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E48
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveCameraOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081C74
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x8c
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_BeginRoundSpecificAnims
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word MapAnim_WaitForHPToEndChangingMaybe
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E54
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word ResetMapPaletteAnimations
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_089A4E04
gUnknown_089A4E04:  @ 0x089A4E04
        @ PROC_CALL
        .short 0x2, 0x0
        .word DisableMapPaletteAnimations
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E48
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveCameraOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081C94
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x3c
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_BeginRoundSpecificAnims
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word MapAnim_WaitForHPToEndChangingMaybe
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E54
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word ResetMapPaletteAnimations
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_089A4EA4
gUnknown_089A4EA4:  @ 0x089A4EA4
        @ PROC_CALL
        .short 0x2, 0x0
        .word DisableMapPaletteAnimations
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E48
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveCameraOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80819A8
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x40
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_BeginRoundSpecificAnims
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word MapAnim_WaitForHPToEndChangingMaybe
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E54
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word ResetMapPaletteAnimations
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_089A4F44
gUnknown_089A4F44:  @ 0x089A4F44
        @ PROC_CALL
        .short 0x2, 0x0
        .word DisableMapPaletteAnimations
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E48
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveCameraOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081C54
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x50
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E54
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word ResetMapPaletteAnimations
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_089A4FCC
gUnknown_089A4FCC:  @ 0x089A4FCC
        @ PROC_CALL
        .short 0x2, 0x0
        .word DisableMapPaletteAnimations
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E48
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveCameraOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081CB4
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x50
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E54
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word ResetMapPaletteAnimations
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_089A5054
gUnknown_089A5054:  @ 0x089A5054
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveCameraOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_PoisonEffectOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x5e
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_PoisonDmgMapEffect
ProcScr_PoisonDmgMapEffect:  @ 0x089A508C
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveCameraOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_PoisonEffectOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x32
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_BeginRoundSpecificAnims
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word MapAnim_WaitForHPToEndChangingMaybe
        @ PROC_SLEEP
        .short 0xe, 0x2c
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_EggDmgMapEffect1
ProcScr_EggDmgMapEffect1:  @ 0x089A50DC
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveCameraOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081CD4
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_BeginRoundSpecificAnims
        @ PROC_SLEEP
        .short 0xe, 0x5
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word MapAnim_WaitForHPToEndChangingMaybe
        @ PROC_SLEEP
        .short 0xe, 0x5
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E60
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_EggDmgMapEffect2
ProcScr_EggDmgMapEffect2:  @ 0x089A5124
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveCameraOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081970
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x32
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_CritAtkMapEffect
ProcScr_CritAtkMapEffect:  @ 0x089A5154
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveCameraOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_BeginRoundSpecificAnims
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word MapAnim_WaitForHPToEndChangingMaybe
        @ PROC_SLEEP
        .short 0xe, 0x14
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_089A518C
gUnknown_089A518C:  @ 0x089A518C
        @ PROC_CALL
        .short 0x2, 0x0
        .word DisableMapPaletteAnimations
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E48
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveCameraOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80819C8
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x3c
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E54
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word ResetMapPaletteAnimations
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_089A5214
gUnknown_089A5214:  @ 0x089A5214
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveCameraOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081B70
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081CD4
        @ PROC_SLEEP
        .short 0xe, 0x14
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081D40
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081D1C
        @ PROC_SLEEP
        .short 0xe, 0x8
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E04
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80815EC
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081D84
        @ PROC_SLEEP
        .short 0xe, 0x28
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081BCC
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081DE0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081CF8
        @ PROC_SLEEP
        .short 0xe, 0x10
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveCameraOnSubject
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_089A52FC
gUnknown_089A52FC:  @ 0x089A52FC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80825B0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80825B8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A5314
gUnknown_089A5314:  @ 0x089A5314
	.incbin "baserom.gba", 0x9A5314, 0x758

	.global gUnknown_089A5A6C
gUnknown_089A5A6C:  @ 0x089A5A6C
	.incbin "baserom.gba", 0x9A5A6C, 0x78C

	.global gUnknown_089A61F8
gUnknown_089A61F8:  @ 0x089A61F8
	.incbin "baserom.gba", 0x9A61F8, 0x5C

	.global gUnknown_089A6254
gUnknown_089A6254:  @ 0x089A6254
	.incbin "baserom.gba", 0x9A6254, 0xCEC

	.global Obj_PoisonAnim
Obj_PoisonAnim:  @ 0x089A6F40
	.incbin "baserom.gba", 0x9A6F40, 0x98

	.global Obj_WallBreakAnim
Obj_WallBreakAnim:  @ 0x089A6FD8
	.incbin "baserom.gba", 0x9A6FD8, 0x1F20

	.global gUnknown_089A8EF8
gUnknown_089A8EF8:  @ 0x089A8EF8
	.incbin "baserom.gba", 0x9A8EF8, 0x7C

	.global gUnknown_089A8F74
gUnknown_089A8F74:  @ 0x089A8F74
	.incbin "baserom.gba", 0x9A8F74, 0x20

	.global gGfx_ArenaBuildingFront
gGfx_ArenaBuildingFront:  @ 0x089A8F94
	.incbin "baserom.gba", 0x9A8F94, 0x2BDC

	.global gTsa_ArenaBuildingFront
gTsa_ArenaBuildingFront:  @ 0x089ABB70
	.incbin "baserom.gba", 0x9ABB70, 0x4B4

	.global gPal_ArenaBuildingFront
gPal_ArenaBuildingFront:  @ 0x089AC024
	.incbin "baserom.gba", 0x9AC024, 0x80

	.global Img_MapAnimMISS
Img_MapAnimMISS:  @ 0x089AC0A4
	.incbin "baserom.gba", 0x9AC0A4, 0xF0

	.global Obj_MapAnimMISS
Obj_MapAnimMISS:  @ 0x089AC194
	.incbin "baserom.gba", 0x9AC194, 0x168

	.global Img_MapAnimNODAMAGE
Img_MapAnimNODAMAGE:  @ 0x089AC2FC
	.incbin "baserom.gba", 0x9AC2FC, 0x144

	.global obj_MapAnimNODAMAGE
obj_MapAnimNODAMAGE:  @ 0x089AC440
	.incbin "baserom.gba", 0x9AC440, 0x18C

	.global gUnknown_089AC5CC
gUnknown_089AC5CC:  @ 0x089AC5CC
    .incbin "baserom.gba", 0x9AC5CC, 0x1C8

	.global gUnknown_089AC794
gUnknown_089AC794:  @ 0x089AC794
    .incbin "baserom.gba", 0x9AC794, 0x214

	.global gUnknown_089AC9A8
gUnknown_089AC9A8:  @ 0x089AC9A8
	.incbin "baserom.gba", 0x9AC9A8, 0x60

	.global gUnknown_089ACA08
gUnknown_089ACA08:  @ 0x089ACA08
	.incbin "baserom.gba", 0x9ACA08, 0x290

	.global gUnknown_089ACC98
gUnknown_089ACC98:  @ 0x089ACC98
    .incbin "baserom.gba", 0x9ACC98, 0x800

	.global gUnknown_089AD498
gUnknown_089AD498:  @ 0x089AD498
	.incbin "baserom.gba", 0x9AD498, 0x68

	.global Img_MapBattleInfoBox
Img_MapBattleInfoBox:  @ 0x089AD500
	.incbin "baserom.gba", 0x9AD500, 0x148

	.global Pal_MapBattleInfoBlue
Pal_MapBattleInfoBlue:  @ 0x089AD648
	.incbin "baserom.gba", 0x9AD648, 0x20

	.global Pal_MapBattleInfoRed
Pal_MapBattleInfoRed:  @ 0x089AD668
    .incbin "baserom.gba", 0x9AD668, 0x20

	.global Pal_MapBattleInfoGreen
Pal_MapBattleInfoGreen:  @ 0x089AD688
	.incbin "baserom.gba", 0x9AD688, 0x20

	.global Pal_MapBattleInfoPurple
Pal_MapBattleInfoPurple:  @ 0x089AD6A8
    .incbin "baserom.gba", 0x9AD6A8, 0x20

    .global Tsa_MapBattleBoxGfx1
Tsa_MapBattleBoxGfx1:   @ 0x089AD6C8
    .incbin "baserom.gba", 0x9AD6C8, 0x4C

    .global Tsa_MapBattleBoxGfx2
Tsa_MapBattleBoxGfx2:   @ 0x089AD714
    .incbin "baserom.gba", 0x9AD714, 0x38

    .global Tsa_MapBattleBoxGfx3
Tsa_MapBattleBoxGfx3:   @ 0x089AD74C
    .incbin "baserom.gba", 0x9AD74C, 0x40

	.global Img_MapBattleInfoHpBar
Img_MapBattleInfoHpBar:  @ 0x089AD78C
	.incbin "baserom.gba", 0x9AD78C, 0xDC

	.global Img_MapBattleInfoNum
Img_MapBattleInfoNum:  @ 0x089AD868
	.incbin "baserom.gba", 0x9AD868, 0xCC

	.global gUnknown_089AD934
gUnknown_089AD934:  @ 0x089AD934
	.incbin "baserom.gba", 0x9AD934, 0xC4

	.global gUnknown_089AD9F8
gUnknown_089AD9F8:  @ 0x089AD9F8
	.incbin "baserom.gba", 0x9AD9F8, 0x88

	.global Img_WallBreakAnim
Img_WallBreakAnim:  @ 0x089ADA80
    .incbin "baserom.gba", 0x9ADA80, 0x28C

	.global Pal_WallBreakAnim
Pal_WallBreakAnim:  @ 0x089ADD0C
	.incbin "baserom.gba", 0x9ADD0C, 0x40

	.global gUnknown_089ADD4C
gUnknown_089ADD4C:  @ 0x089ADD4C
	.incbin "baserom.gba", 0x9ADD4C, 0x164

	.global Img_PoisonAnim
Img_PoisonAnim:  @ 0x089ADEB0
	.incbin "baserom.gba", 0x9ADEB0, 0x354

	.global Pal_PoisonAnim
Pal_PoisonAnim:  @ 0x089AE204
	.incbin "baserom.gba", 0x9AE204, 0x20

	.global gUnknown_089AE224
gUnknown_089AE224:  @ 0x089AE224
	.incbin "baserom.gba", 0x9AE224, 0x260

	.global gUnknown_089AE484
gUnknown_089AE484:  @ 0x089AE484
	.incbin "baserom.gba", 0x9AE484, 0x20

	.global gUnknown_089AE4A4
gUnknown_089AE4A4:  @ 0x089AE4A4
	.incbin "baserom.gba", 0x9AE4A4, 0x300

	.global gUnknown_089AE7A4
gUnknown_089AE7A4:  @ 0x089AE7A4
	.incbin "baserom.gba", 0x9AE7A4, 0x20

	.global gUnknown_089AE7C4
gUnknown_089AE7C4:  @ 0x089AE7C4
	.incbin "baserom.gba", 0x9AE7C4, 0x40

	.global gUnknown_089AE804
gUnknown_089AE804:  @ 0x089AE804
	.incbin "baserom.gba", 0x9AE804, 0xB0C

	.global gUnknown_089AF310
gUnknown_089AF310:  @ 0x089AF310
	.incbin "baserom.gba", 0x9AF310, 0x600

	.global gUnknown_089AF910
gUnknown_089AF910:  @ 0x089AF910
	.incbin "baserom.gba", 0x9AF910, 0x20

	.global gUnknown_089AF930
gUnknown_089AF930:  @ 0x089AF930
	.incbin "baserom.gba", 0x9AF930, 0x20

	.global gUnknown_089AF950
gUnknown_089AF950:  @ 0x089AF950
	.incbin "baserom.gba", 0x9AF950, 0x174

	.global gUnknown_089AFAC4
gUnknown_089AFAC4:  @ 0x089AFAC4
	.incbin "baserom.gba", 0x9AFAC4, 0x1F8

	.global gUnknown_089AFCBC
gUnknown_089AFCBC:  @ 0x089AFCBC
	.incbin "baserom.gba", 0x9AFCBC, 0x2BC

	.global gUnknown_089AFF78
gUnknown_089AFF78:  @ 0x089AFF78
	.incbin "baserom.gba", 0x9AFF78, 0x40

	.global gUnknown_089AFFB8
gUnknown_089AFFB8:  @ 0x089AFFB8
	.incbin "baserom.gba", 0x9AFFB8, 0x40

	.global gUnknown_089AFFF8
gUnknown_089AFFF8:  @ 0x089AFFF8
    .incbin "baserom.gba", 0x9AFFF8, 0x3DC

	.global gUnknown_089B03D4
gUnknown_089B03D4:  @ 0x089B03D4
	.incbin "baserom.gba", 0x9B03D4, 0x2B8

	.global gUnknown_089B068C
gUnknown_089B068C:  @ 0x089B068C
	.incbin "baserom.gba", 0x9B068C, 0x20

	.global gUnknown_089B06AC
gUnknown_089B06AC:  @ 0x089B06AC
	.incbin "baserom.gba", 0x9B06AC, 0x54

	.global gUnknown_089B0700
gUnknown_089B0700:  @ 0x089B0700
	.incbin "baserom.gba", 0x9B0700, 0x20

	.global gUnknown_089B0720
gUnknown_089B0720:  @ 0x089B0720
	.incbin "baserom.gba", 0x9B0720, 0x100

	.global gUnknown_089B0820
gUnknown_089B0820:  @ 0x089B0820
	.incbin "baserom.gba", 0x9B0820, 0x20

	.global gUnknown_089B0840
gUnknown_089B0840:  @ 0x089B0840
    .incbin "baserom.gba", 0x9B0840, 0x24

	.global gUnknown_089B0864
gUnknown_089B0864:  @ 0x089B0864
	.incbin "baserom.gba", 0x9B0864, 0x26C

	.global gUnknown_089B0AD0
gUnknown_089B0AD0:  @ 0x089B0AD0
	.incbin "baserom.gba", 0x9B0AD0, 0xCD4

	.global gUnknown_089B17A4
gUnknown_089B17A4:  @ 0x089B17A4
	.incbin "baserom.gba", 0x9B17A4, 0x26C

	.global gUnknown_089B1A10
gUnknown_089B1A10:  @ 0x089B1A10
	.incbin "baserom.gba", 0x9B1A10, 0x400

	.global gUnknown_089B1E10
gUnknown_089B1E10:  @ 0x089B1E10
	.incbin "baserom.gba", 0x9B1E10, 0x2D8

	.global gUnknown_089B20E8
gUnknown_089B20E8:  @ 0x089B20E8
	.incbin "baserom.gba", 0x9B20E8, 0x20

	.global gUnknown_089B2108
gUnknown_089B2108:  @ 0x089B2108
	.incbin "baserom.gba", 0x9B2108, 0xD0

	.global gUnknown_089B21D8
gUnknown_089B21D8:  @ 0x089B21D8
	.incbin "baserom.gba", 0x9B21D8, 0x440

	.global gUnknown_089B2618
gUnknown_089B2618:  @ 0x089B2618
    .incbin "baserom.gba", 0x9B2618, 0x110

	.global gUnknown_089B2728
gUnknown_089B2728:  @ 0x089B2728
	.incbin "baserom.gba", 0x9B2728, 0x20

	.global gUnknown_089B2748
gUnknown_089B2748:  @ 0x089B2748
	.incbin "baserom.gba", 0x9B2748, 0x138

	.global gUnknown_089B2880
gUnknown_089B2880:  @ 0x089B2880
	.incbin "baserom.gba", 0x9B2880, 0xBBC

	.global gUnknown_089B343C
gUnknown_089B343C:  @ 0x089B343C
	.incbin "baserom.gba", 0x9B343C, 0x194

	.global gUnknown_089B35D0
gUnknown_089B35D0:  @ 0x089B35D0
	.incbin "baserom.gba", 0x9B35D0, 0x162C

	.global gUnknown_089B4BFC
gUnknown_089B4BFC:  @ 0x089B4BFC
    .incbin "baserom.gba", 0x9B4BFC, 0x1EA4

	.global gUnknown_089B6AA0
gUnknown_089B6AA0:  @ 0x089B6AA0
	.incbin "baserom.gba", 0x9B6AA0, 0x934

	.global gUnknown_089B73D4
gUnknown_089B73D4:  @ 0x089B73D4
	.incbin "baserom.gba", 0x9B73D4, 0x23C

	.global gUnknown_089B7610
gUnknown_089B7610:  @ 0x089B7610
	.incbin "baserom.gba", 0x9B7610, 0xAB4

	.global gUnknown_089B80C4
gUnknown_089B80C4:  @ 0x089B80C4
	.incbin "baserom.gba", 0x9B80C4, 0x2F088

	.global gUnknown_089E714C
gUnknown_089E714C:  @ 0x089E714C
	.incbin "baserom.gba", 0x9E714C, 0xCA0

	.global gUnknown_089E7DEC
gUnknown_089E7DEC:  @ 0x089E7DEC
	.incbin "baserom.gba", 0x9E7DEC, 0x44C

	.global gUnknown_089E8238
gUnknown_089E8238:  @ 0x089E8238
    .incbin "baserom.gba", 0x9E8238, 0xA8

	.global gUnknown_089E82E0
gUnknown_089E82E0:  @ 0x089E82E0
	.incbin "baserom.gba", 0x9E82E0, 0xA4

	.global gUnknown_089E8384
gUnknown_089E8384:  @ 0x089E8384
	.incbin "baserom.gba", 0x9E8384, 0x5C

	.global gUnknown_089E83E0
gUnknown_089E83E0:  @ 0x089E83E0
	.incbin "baserom.gba", 0x9E83E0, 0x54

	.global gUnknown_089E8434
gUnknown_089E8434:  @ 0x089E8434
	.incbin "baserom.gba", 0x9E8434, 0x50

	.global gUnknown_089E8484
gUnknown_089E8484:  @ 0x089E8484
	.incbin "baserom.gba", 0x9E8484, 0x50

	.global gUnknown_089E84D4
gUnknown_089E84D4:  @ 0x089E84D4
	.incbin "baserom.gba", 0x9E84D4, 0x20

	.global gUnknown_089E84F4
gUnknown_089E84F4:  @ 0x089E84F4
@ Replacing .incbin "baserom.gba", 0x9E84F4, 0x88
    .4byte sub_8083830
    .4byte 0x00000001
    .4byte CheckAFEV
    .4byte 0x00000003
    .4byte CheckTURN
    .4byte 0x00000003
    .4byte CheckCHAR
    .4byte 0x00000004
    .4byte CheckCHARASM
    .4byte 0x00000004
    .4byte CheckLOCA
    .4byte 0x00000003
    .4byte CheckVILL
    .4byte 0x00000003
    .4byte CheckCHES
    .4byte 0x00000003
    .4byte CheckDOOR
    .4byte 0x00000003
    .4byte sub_8083A10
    .4byte 0x00000003
    .4byte CheckSHOP
    .4byte 0x00000003
    .4byte CheckAREA
    .4byte 0x00000003
    .4byte sub_8083B24
    .4byte 0x00000003
    .4byte sub_8083B28
    .4byte 0x00000003
    .4byte sub_8083B2C
    .4byte 0x00000003
    .4byte sub_8083B58
    .4byte 0x00000004
    .4byte sub_8083B98
    .4byte 0x00000004

@ XXX noah: Appears to contain pointers, possibly procs?
	.global gUnknown_089E857C
gUnknown_089E857C:  @ 0x089E857C
@ Replacing .incbin "baserom.gba", 0x9E857C, 0x4140
    .4byte 0x08040201
    .4byte 0x80402010
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000002
    .4byte gUnknown_089EEA28 + 0x7ec
    .4byte 0x00800001
    .4byte 0x00000002
    .4byte gUnknown_089EEA28 + 0x814
    .4byte 0x00000002
    .4byte 0x00000002
    .4byte gUnknown_089EEA28 + 0x82c
    .4byte 0x00000003
    .4byte 0x00080002
    .4byte gUnknown_089EEA28 + 0x704
    .4byte 0x0080ff01
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00030001
    .4byte gUnknown_089EEA28 + 0x73c
    .4byte 0x00000002
    .4byte 0x00070001
    .4byte gUnknown_089EEA28 + 0x6b0
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089EEA28 + 0x888
    .4byte gUnknown_089EEA28 + 0x900
    .4byte gUnknown_089EEA28 + 0x960
    .4byte gUnknown_089EEA28 + 0x970
    .4byte gUnknown_089EEA28 + 0xa44
    .4byte gUnknown_089EEA28 + 0xac4
    .4byte gUnknown_089EEA28 + 0xae4
    .4byte gUnknown_089EEA28 + 0xb14
    .4byte gUnknown_089EEA28 + 0xb44
    .4byte gUnknown_089EEA28 + 0xb80
    .4byte gUnknown_089EEA28 + 0xcb8
    .4byte gUnknown_089EEA28 + 0xd30
    .4byte gUnknown_089EEA28 + 0xd90
    .4byte gUnknown_089EEA28 + 0xda0
    .4byte gUnknown_089EEA28 + 0xdd4
    .4byte 0x00000000

	.global PrologueEvents
PrologueEvents:  @ 0x089E863C
    .4byte gUnknown_089E857C + 0x10
    .4byte gUnknown_089E857C + 0x44
    .4byte gUnknown_089E857C + 0x48
    .4byte gUnknown_089E857C + 0x4c
    .4byte gUnknown_089E857C + 0x74
    .4byte gUnknown_089E857C + 0x78
    .4byte gUnknown_089E857C + 0x7c
    .4byte gUnknown_089E857C + 0x80
    .4byte gUnknown_089ED6AC + 0x2fc
    .4byte gUnknown_089ED6AC + 0x7ed
    .4byte gUnknown_088B3AD8 + 0x13c
    .4byte gUnknown_088B3AD8 + 0x13c
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089EEA28 + 0x1c0
    .4byte gUnknown_089EEA28 + 0x73c

	.global gUnknown_089E868C
gUnknown_089E868C:  @ 0x089E868C
    .4byte 0x00000002
    .4byte gUnknown_089EEA28 + 0x1000
    .4byte 0x00000101
    .4byte 0x00000002
    .4byte gUnknown_089EEA28 + 0x1018
    .4byte 0x00800101
    .4byte 0x00000002
    .4byte gUnknown_089EEA28 + 0x1040
    .4byte 0x00000202
    .4byte 0x000b0002
    .4byte gUnknown_089EEA28 + 0x11c0
    .4byte 0x0000ff01
    .4byte 0x00000000
    .4byte 0x00080003
    .4byte gUnknown_089EEA28 + 0x1110
    .4byte 0x00000402
    .4byte 0x00000000
    .4byte 0x00080003
    .4byte gUnknown_089EEA28 + 0x1110
    .4byte 0x00000204
    .4byte 0x00000000
    .4byte 0x00090003
    .4byte gUnknown_089EEA28 + 0x1130
    .4byte 0x00000401
    .4byte 0x00000000
    .4byte 0x00090003
    .4byte gUnknown_089EEA28 + 0x1130
    .4byte 0x00000104
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000005
    .4byte gUnknown_089EEA28 + 0x1150
    .4byte 0x0010060d
    .4byte 0x00000005
    .4byte gUnknown_089EEA28 + 0x117c
    .4byte 0x0010040a
    .4byte 0x00030005
    .4byte 0x00000001
    .4byte 0x00110202
    .4byte 0x00000000
    .4byte 0x00070001
    .4byte gUnknown_089EEA28 + 0x1084
    .4byte 0x00000002
    .4byte 0x000a000b
    .4byte gUnknown_089EEA28 + 0x11a4
    .4byte 0x09070000
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089EEA28 + 0x1274
    .4byte gUnknown_089EEA28 + 0x12ec
    .4byte gUnknown_089EEA28 + 0x134c
    .4byte gUnknown_089EEA28 + 0x1380
    .4byte gUnknown_089EEA28 + 0x14f8
    .4byte gUnknown_089EEA28 + 0x1574
    .4byte gUnknown_089EEA28 + 0x15d4
    .4byte gUnknown_089EEA28 + 0x1608
    .4byte gUnknown_089EEA28 + 0x1638
    .4byte gUnknown_089EEA28 + 0x1708
    .4byte gUnknown_089EEA28 + 0x1780
    .4byte gUnknown_089EEA28 + 0x17e0
    .4byte gUnknown_089EEA28 + 0x1814
    .4byte gUnknown_089EEA28 + 0x1848
    .4byte 0x00000000

	.global Ch1Events
Ch1Events:  @ 0x089E879C
    .4byte gUnknown_089E857C + 0x110
    .4byte gUnknown_089E857C + 0x144
    .4byte gUnknown_089E857C + 0x188
    .4byte gUnknown_089E857C + 0x1b0
    .4byte gUnknown_089E857C + 0x1d8
    .4byte gUnknown_089E857C + 0x1dc
    .4byte gUnknown_089E857C + 0x1e0
    .4byte gUnknown_089E857C + 0x1e4
    .4byte gUnknown_089ED6AC + 0x2ff
    .4byte gUnknown_089ED6AC + 0x7f0
    .4byte gUnknown_088B3AD8 + 0x5c8
    .4byte gUnknown_088B3AD8 + 0x5c8
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089EEA28 + 0xe20
    .4byte gUnknown_089EEA28 + 0x109c

	.global gUnknown_089E87EC
gUnknown_089E87EC:  @ 0x089E87EC
    .4byte 0x00000002
    .4byte gUnknown_089EEA28 + 0x1a5c
    .4byte 0x00000001
    .4byte 0x00000002
    .4byte gUnknown_089EEA28 + 0x1a74
    .4byte 0x00000002
    .4byte 0x00000002
    .4byte gUnknown_089EEA28 + 0x1d20
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00070003
    .4byte gUnknown_089EEA28 + 0x1bd4
    .4byte 0x00000701
    .4byte 0x00000000
    .4byte 0x00080003
    .4byte gUnknown_089EEA28 + 0x1c00
    .4byte 0x00000a07
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00090006
    .4byte gUnknown_089EEA28 + 0x1c28
    .4byte 0x00100204
    .4byte 0x00090005
    .4byte 0x00000001
    .4byte 0x00200104
    .4byte 0x000a0006
    .4byte gUnknown_089EEA28 + 0x1ca8
    .4byte 0x00100207
    .4byte 0x000a0005
    .4byte 0x00000001
    .4byte 0x00200107
    .4byte 0x000b0006
    .4byte gUnknown_089EEA28 + 0x1ce4
    .4byte 0x00100c01
    .4byte 0x000b0005
    .4byte 0x00000001
    .4byte 0x00200b01
    .4byte 0x0000000a
    .4byte gUnknown_089ED6AC + 0x120
    .4byte 0x00160705
    .4byte 0x00000000
    .4byte 0x00030001
    .4byte gUnknown_089EEA28 + 0x1a8c
    .4byte 0x00000006
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089EEA28 + 0x1de0
    .4byte gUnknown_089EEA28 + 0x1e58
    .4byte gUnknown_089EEA28 + 0x1eb8
    .4byte gUnknown_089EEA28 + 0x1ee8
    .4byte gUnknown_089EEA28 + 0x1f44
    .4byte gUnknown_089EEA28 + 0x1fa0
    .4byte gUnknown_089EEA28 + 0x1fb0
    .4byte gUnknown_089EEA28 + 0x2000
    .4byte gUnknown_089EEA28 + 0x2078
    .4byte gUnknown_089EEA28 + 0x20d8
    .4byte gUnknown_089EEA28 + 0x22a4
    .4byte gUnknown_089EEA28 + 0x2320
    .4byte gUnknown_089EEA28 + 0x2380
    .4byte gUnknown_089EEA28 + 0x2390
    .4byte gUnknown_089EEA28 + 0x23ec
    .4byte gUnknown_089EEA28 + 0x2448
    .4byte gUnknown_089EEA28 + 0x2458
    .4byte gUnknown_089EEA28 + 0x24ac
    .4byte gUnknown_089EEA28 + 0x252c
    .4byte gUnknown_089EEA28 + 0x254c
    .4byte gUnknown_089EEA28 + 0x257c
    .4byte gUnknown_089EEA28 + 0x20e8
    .4byte gUnknown_089EEA28 + 0x2140
    .4byte gUnknown_089EEA28 + 0x21b8
    .4byte gUnknown_089EEA28 + 0x2218
    .4byte gUnknown_089EEA28 + 0x2248
    .4byte gUnknown_089EEA28 + 0x2600
    .4byte gUnknown_089EEA28 + 0x267c
    .4byte gUnknown_089EEA28 + 0x26dc
    .4byte gUnknown_089EEA28 + 0x270c
    .4byte 0x00000000

	.global Ch2Events
Ch2Events:  @ 0x089E8934
    .4byte gUnknown_089E857C + 0x270
    .4byte gUnknown_089E857C + 0x298
    .4byte gUnknown_089E857C + 0x2bc
    .4byte gUnknown_089E857C + 0x314
    .4byte gUnknown_089E857C + 0x330
    .4byte gUnknown_089E857C + 0x334
    .4byte gUnknown_089E857C + 0x338
    .4byte gUnknown_089E857C + 0x33c
    .4byte gUnknown_089ED6AC + 0x300
    .4byte gUnknown_089ED6AC + 0x7f1
    .4byte gUnknown_088B3AD8 + 0x7f4
    .4byte gUnknown_088B3AD8 + 0x7f4
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089EEA28 + 0x1878
    .4byte gUnknown_089EEA28 + 0x1a8c

	.global gUnknown_089E8984
gUnknown_089E8984:  @ 0x089E8984
    .4byte 0x00070002
    .4byte gUnknown_089EEA28 + 0x2924
    .4byte 0x00400101
    .4byte 0x00080002
    .4byte gUnknown_089EEA28 + 0x298c
    .4byte 0x00000202
    .4byte 0x00000000
    .4byte 0x00090003
    .4byte gUnknown_089EEA28 + 0x2b40
    .4byte 0x00000908
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000007
    .4byte 0x00000014
    .4byte 0x00140306
    .4byte 0x00000007
    .4byte 0x00000028
    .4byte 0x00140308
    .4byte 0x00000007
    .4byte 0x00000001
    .4byte 0x0014030a
    .4byte 0x00000007
    .4byte 0x0000001c
    .4byte 0x00140c06
    .4byte 0x00030005
    .4byte 0x00000001
    .4byte 0x0011010e
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120a06
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x0012050a
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120302
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000

	.global Ch3Events
Ch3Events:  @ 0x089E8A38
    .4byte gUnknown_089E857C + 0x408
    .4byte gUnknown_089E857C + 0x424
    .4byte gUnknown_089E857C + 0x438
    .4byte gUnknown_089E857C + 0x49c
    .4byte gUnknown_089E857C + 0x4ac
    .4byte gUnknown_089E857C + 0x4b0
    .4byte gUnknown_089E857C + 0x4b4
    .4byte gUnknown_089E857C + 0x4b8
    .4byte gUnknown_089ED6AC + 0x301
    .4byte gUnknown_089ED6AC + 0x7f2
    .4byte gUnknown_088B3AD8 + 0xa9c
    .4byte gUnknown_088B3AD8 + 0xa9c
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089EEA28 + 0x27d8
    .4byte gUnknown_089EEA28 + 0x29a4

	.global gUnknown_089E8A88
gUnknown_089E8A88:  @ 0x089E8A88
    .4byte 0x00000002
    .4byte gUnknown_089EEA28 + 0x2f74
    .4byte 0x00400002
    .4byte 0x00000002
    .4byte gUnknown_089EEA28 + 0x31ec
    .4byte 0x00000002
    .4byte 0x00080002
    .4byte gUnknown_089EEA28 + 0x3220
    .4byte 0x0000ff01
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000006
    .4byte gUnknown_089EEA28 + 0x3110
    .4byte 0x00100b01
    .4byte 0x00000005
    .4byte 0x00000001
    .4byte 0x00200a01
    .4byte 0x00000006
    .4byte gUnknown_089EEA28 + 0x31b0
    .4byte 0x00100208
    .4byte 0x00000005
    .4byte 0x00000001
    .4byte 0x00200108
    .4byte 0x00000000
    .4byte 0x00030001
    .4byte gUnknown_089EEA28 + 0x2fd0
    .4byte 0x00000006
    .4byte 0x0007000b
    .4byte gUnknown_089EEA28 + 0x3204
    .4byte 0x0e0e0900
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000

	.global Ch4Events
Ch4Events: @0x89e8b20
    .4byte gUnknown_089E857C + 0x50c
    .4byte gUnknown_089E857C + 0x534
    .4byte gUnknown_089E857C + 0x538
    .4byte gUnknown_089E857C + 0x56c
    .4byte gUnknown_089E857C + 0x594
    .4byte gUnknown_089E857C + 0x598
    .4byte gUnknown_089E857C + 0x59c
    .4byte gUnknown_089E857C + 0x5a0
    .4byte gUnknown_089ED6AC + 0x303
    .4byte gUnknown_089ED6AC + 0x7f4
    .4byte gUnknown_088B3AD8 + 0xe2c
    .4byte gUnknown_088B3AD8 + 0xe2c
    .4byte gUnknown_088B3AD8 + 0x12dc
    .4byte gUnknown_088B3AD8 + 0x1548
    .4byte gUnknown_088B3AD8 + 0x17b4
    .4byte gUnknown_088B3AD8 + 0x1390
    .4byte gUnknown_088B3AD8 + 0x15fc
    .4byte gUnknown_088B3AD8 + 0x1868
    .4byte gUnknown_089EEA28 + 0x2d7c
    .4byte gUnknown_089EEA28 + 0x2fd0
    .4byte 0x00000002
    .4byte gUnknown_089EEA28 + 0x387c
    .4byte 0x00000002
    .4byte 0x00000002
    .4byte gUnknown_089EEA28 + 0x38c4
    .4byte 0x00000006
    .4byte 0x00000002
    .4byte gUnknown_089EEA28 + 0x38dc
    .4byte 0x00000008
    .4byte 0x00000000
    .4byte 0x00070003
    .4byte gUnknown_089EEA28 + 0x3848
    .4byte 0x0000200d
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000000a
    .4byte gUnknown_089ED6AC + 0x12c
    .4byte 0x00160102
    .4byte 0x0000000a
    .4byte gUnknown_089ED6AC + 0x142
    .4byte 0x00170a06
    .4byte 0x00080006
    .4byte gUnknown_089EEA28 + 0x3748
    .4byte 0x00100a0c
    .4byte 0x00080005
    .4byte 0x00000001
    .4byte 0x0020090c
    .4byte 0x00090006
    .4byte gUnknown_089EEA28 + 0x3794
    .4byte 0x0010130c
    .4byte 0x00090005
    .4byte 0x00000001
    .4byte 0x0020120c
    .4byte 0x000a0006
    .4byte gUnknown_089EEA28 + 0x37d0
    .4byte 0x00100605
    .4byte 0x000a0005
    .4byte 0x00000001
    .4byte 0x00200505
    .4byte 0x000b0006
    .4byte gUnknown_089EEA28 + 0x380c
    .4byte 0x00100105
    .4byte 0x000b0005
    .4byte 0x00000001
    .4byte 0x00200005
    .4byte 0x00000000
    .4byte 0x00030001
    .4byte gUnknown_089EEA28 + 0x3668
    .4byte 0x00000002
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000

	.global Ch5EventData
Ch5EventData: @0x89e8c54
    .4byte gUnknown_089E857C + 0x5f4
    .4byte gUnknown_089E857C + 0x61c
    .4byte gUnknown_089E857C + 0x630
    .4byte gUnknown_089E857C + 0x6ac
    .4byte gUnknown_089E857C + 0x6c8
    .4byte gUnknown_089E857C + 0x6cc
    .4byte gUnknown_089E857C + 0x6d0
    .4byte gUnknown_089E857C + 0x6d4
    .4byte gUnknown_089ED6AC + 0x304
    .4byte gUnknown_089ED6AC + 0x7f5
    .4byte gUnknown_088B3AD8 + 0x1b58
    .4byte gUnknown_088B3AD8 + 0x1b58
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089EEA28 + 0x3300
    .4byte gUnknown_089EEA28 + 0x3668

    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120c17
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120a04
    .4byte 0x00000007
    .4byte 0x0000006d
    .4byte 0x00140804
    .4byte 0x00000007
    .4byte 0x0000001a
    .4byte 0x00140805
    .4byte 0x00030005
    .4byte 0x00000001
    .4byte 0x0011070d
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000

	.global Ch5XEvents
Ch5XEvents: @0x89e8d0c
    .4byte gUnknown_089E857C + 0x728
    .4byte gUnknown_089E857C + 0x72c
    .4byte gUnknown_089E857C + 0x730
    .4byte gUnknown_089E857C + 0x770
    .4byte gUnknown_089E857C + 0x780
    .4byte gUnknown_089E857C + 0x784
    .4byte gUnknown_089E857C + 0x788
    .4byte gUnknown_089E857C + 0x78c
    .4byte gUnknown_089ED6AC + 0x305
    .4byte gUnknown_089ED6AC + 0x7f6
    .4byte gUnknown_088B3AD8 + 0x1f8c
    .4byte gUnknown_088B3AD8 + 0x1f8c
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089EEA28 + 0x39d4
    .4byte gUnknown_089EEA28 + 0x3bd4
    .4byte 0x00000002
    .4byte gUnknown_089EEA28 + 0x414c
    .4byte 0x00000004
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000006
    .4byte gUnknown_089EEA28 + 0x4070
    .4byte 0x0010120b
    .4byte 0x00000005
    .4byte 0x00000001
    .4byte 0x0020110b
    .4byte 0x00000000
    .4byte 0x00030001
    .4byte gUnknown_089EEA28 + 0x3fd4
    .4byte 0x00000002
    .4byte 0x0007000b
    .4byte gUnknown_089EEA28 + 0x3f18
    .4byte 0x0e1b0918
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000

	.global Ch6Events
Ch6Events: @0x89e8dc4
    .4byte gUnknown_089E857C + 0x7e0
    .4byte gUnknown_089E857C + 0x7f0
    .4byte gUnknown_089E857C + 0x7f4
    .4byte gUnknown_089E857C + 0x810
    .4byte gUnknown_089E857C + 0x838
    .4byte gUnknown_089E857C + 0x83c
    .4byte gUnknown_089E857C + 0x840
    .4byte gUnknown_089E857C + 0x844
    .4byte gUnknown_089ED6AC + 0x30a
    .4byte gUnknown_089ED6AC + 0x7fb
    .4byte gUnknown_088B3AD8 + 0x2900
    .4byte gUnknown_088B3AD8 + 0x2900
    .4byte gUnknown_088B3AD8 + 0x2a68
    .4byte gUnknown_088B3AD8 + 0x2d60
    .4byte gUnknown_088B3AD8 + 0x3058
    .4byte gUnknown_088B3AD8 + 0x2b30
    .4byte gUnknown_088B3AD8 + 0x2e28
    .4byte gUnknown_088B3AD8 + 0x3120
    .4byte gUnknown_089EEA28 + 0x3cf0
    .4byte gUnknown_089EEA28 + 0x3fd4
    .4byte 0x00000002
    .4byte gUnknown_089EEA28 + 0x42d4
    .4byte 0x00800001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00030005
    .4byte 0x00000001
    .4byte 0x00110409
    .4byte 0x00000005
    .4byte gUnknown_089EEA28 + 0x4444
    .4byte 0x00100f01
    .4byte 0x00000005
    .4byte gUnknown_089EEA28 + 0x446c
    .4byte 0x00101511
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000

	.global Ch7EventData
Ch7EventData: @0x89e8e70
    .4byte gUnknown_089E857C + 0x898
    .4byte gUnknown_089E857C + 0x8a8
    .4byte gUnknown_089E857C + 0x8ac
    .4byte gUnknown_089E857C + 0x8d4
    .4byte gUnknown_089E857C + 0x8e4
    .4byte gUnknown_089E857C + 0x8e8
    .4byte gUnknown_089E857C + 0x8ec
    .4byte gUnknown_089E857C + 0x8f0
    .4byte gUnknown_089ED6AC + 0x30b
    .4byte gUnknown_089ED6AC + 0x7fc
    .4byte gUnknown_088B3AD8 + 0x33a0
    .4byte gUnknown_088B3AD8 + 0x33a0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089EEA28 + 0x4164
    .4byte gUnknown_089EEA28 + 0x4300
    .4byte 0x00000002
    .4byte gUnknown_089EEA28 + 0x46fc
    .4byte 0x00000202
    .4byte 0x000c0002
    .4byte gUnknown_089EEA28 + 0x4828
    .4byte 0x0000ff01
    .4byte 0x00000002
    .4byte gUnknown_089EEA28 + 0x4840
    .4byte 0x00000005
    .4byte 0x00000000
    .4byte 0x00070003
    .4byte gUnknown_089EEA28 + 0x4790
    .4byte 0x00000f01
    .4byte 0x00000000
    .4byte 0x00070003
    .4byte gUnknown_089EEA28 + 0x4790
    .4byte 0x0000010f
    .4byte 0x00000000
    .4byte 0x00080003
    .4byte gUnknown_089EEA28 + 0x47ac
    .4byte 0x0000020f
    .4byte 0x00000000
    .4byte 0x00080003
    .4byte gUnknown_089EEA28 + 0x47ac
    .4byte 0x00000f02
    .4byte 0x00000000
    .4byte 0x00090003
    .4byte gUnknown_089EEA28 + 0x47cc
    .4byte 0x00001102
    .4byte 0x00000000
    .4byte 0x00090003
    .4byte gUnknown_089EEA28 + 0x47cc
    .4byte 0x00000211
    .4byte 0x00000000
    .4byte 0x000a0003
    .4byte gUnknown_089EEA28 + 0x47ec
    .4byte 0x00001004
    .4byte 0x00000000
    .4byte 0x000a0003
    .4byte gUnknown_089EEA28 + 0x47ec
    .4byte 0x00000410
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120714
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120501
    .4byte 0x00000007
    .4byte 0x00000004
    .4byte 0x00140301
    .4byte 0x00000007
    .4byte 0x00000067
    .4byte 0x00140302
    .4byte 0x00030005
    .4byte 0x00000001
    .4byte 0x0011020a
    .4byte 0x00000007
    .4byte 0x0000005b
    .4byte 0x00140413
    .4byte 0x00000000
    .4byte 0x000b000b
    .4byte gUnknown_089EEA28 + 0x480c
    .4byte 0x0a0f0005
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000

	.global Ch8EventData
Ch8EventData: @0x89e8fe4
    .4byte gUnknown_089E857C + 0x944
    .4byte gUnknown_089E857C + 0x96c
    .4byte gUnknown_089E857C + 0x9f0
    .4byte gUnknown_089E857C + 0xa3c
    .4byte gUnknown_089E857C + 0xa58
    .4byte gUnknown_089E857C + 0xa5c
    .4byte gUnknown_089E857C + 0xa60
    .4byte gUnknown_089E857C + 0xa64
    .4byte gUnknown_089ED6AC + 0x319
    .4byte gUnknown_089ED6AC + 0x7fe
    .4byte gUnknown_088B3AD8 + 0x3828
    .4byte gUnknown_088B3AD8 + 0x3828
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089EEA28 + 0x4510
    .4byte gUnknown_089EEA28 + 0x4764
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xae4
    .4byte 0x00000005
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xa30
    .4byte 0x00000003
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xa48
    .4byte 0x00000004
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xa18
    .4byte 0x00000002
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xa78
    .4byte 0x00000003
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xa60
    .4byte 0x00000004
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xa90
    .4byte 0x00000005
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xaa8
    .4byte 0x00000005
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x978
    .4byte 0x0000000c
    .4byte 0x00000000
    .4byte 0x00070003
    .4byte gUnknown_089F36A0 + 0x8ac
    .4byte 0x00001201
    .4byte 0x00000000
    .4byte 0x00070003
    .4byte gUnknown_089F36A0 + 0x8d4
    .4byte 0x00001204
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000000a
    .4byte gUnknown_089ED6AC + 0x14c
    .4byte 0x00170201
    .4byte 0x00080006
    .4byte gUnknown_089F36A0 + 0x8fc
    .4byte 0x00100b01
    .4byte 0x00080005
    .4byte 0x00000001
    .4byte 0x00200a01
    .4byte 0x00090006
    .4byte gUnknown_089F36A0 + 0x93c
    .4byte 0x00100f0b
    .4byte 0x00090005
    .4byte 0x00000001
    .4byte 0x00200e0b
    .4byte 0x0000000a
    .4byte gUnknown_089ED6AC + 0x162
    .4byte 0x00160501
    .4byte 0x00000000
    .4byte 0x00030001
    .4byte gUnknown_089F36A0 + 0x718
    .4byte 0x00000006
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000

	.global Ch9EirikaEvents
Ch9EirikaEvents: @0x89e9140
    .4byte gUnknown_089E857C + 0xab8
    .4byte gUnknown_089E857C + 0xb28
    .4byte gUnknown_089E857C + 0xb4c
    .4byte gUnknown_089E857C + 0xb98
    .4byte gUnknown_089E857C + 0xbb4
    .4byte gUnknown_089E857C + 0xbb8
    .4byte gUnknown_089E857C + 0xbbc
    .4byte gUnknown_089E857C + 0xbc0
    .4byte gUnknown_089ED6AC + 0x31c
    .4byte gUnknown_089ED6AC + 0x801
    .4byte gUnknown_088B3AD8 + 0x4134
    .4byte gUnknown_088B3AD8 + 0x4134
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0x2cc
    .4byte gUnknown_089F36A0 + 0x718
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xd00
    .4byte 0x00800001
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x1180
    .4byte 0x00000502
    .4byte 0x000d0002
    .4byte gUnknown_089F36A0 + 0x10b0
    .4byte 0x0000ff01
    .4byte 0x000e0002
    .4byte gUnknown_089F36A0 + 0x122c
    .4byte 0x0080ff01
    .4byte 0x00000000
    .4byte 0x00080003
    .4byte gUnknown_089F36A0 + 0xf94
    .4byte 0x00000b01
    .4byte 0x00000000
    .4byte 0x00080003
    .4byte gUnknown_089F36A0 + 0xfbc
    .4byte 0x00000b22
    .4byte 0x00000000
    .4byte 0x00090003
    .4byte gUnknown_089F36A0 + 0xfe4
    .4byte 0x0000140b
    .4byte 0x00000000
    .4byte 0x00090003
    .4byte gUnknown_089F36A0 + 0x100c
    .4byte 0x00001415
    .4byte 0x00000000
    .4byte 0x000a0003
    .4byte gUnknown_089F36A0 + 0x1034
    .4byte 0x0000150b
    .4byte 0x00000000
    .4byte 0x000a0003
    .4byte gUnknown_089F36A0 + 0x105c
    .4byte 0x00001514
    .4byte 0x00000000
    .4byte 0x000b0003
    .4byte gUnknown_089F36A0 + 0x1084
    .4byte 0x00001614
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x0012090a
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x0012090b
    .4byte 0x00030005
    .4byte 0x00000001
    .4byte 0x0011010f
    .4byte 0x00000005
    .4byte gUnknown_089F36A0 + 0x1108
    .4byte 0x0010060b
    .4byte 0x00000005
    .4byte gUnknown_089F36A0 + 0x1130
    .4byte 0x0010070a
    .4byte 0x00000005
    .4byte gUnknown_089F36A0 + 0x1158
    .4byte 0x0010080d
    .4byte 0x00000000
    .4byte 0x0007000b
    .4byte gUnknown_089F36A0 + 0x1198
    .4byte 0x1e131300
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000

	.global Ch10EirikaEvents
Ch10EirikaEvents: @0x89e92b0
    .4byte gUnknown_089E857C + 0xc14
    .4byte gUnknown_089E857C + 0xc48
    .4byte gUnknown_089E857C + 0xcbc
    .4byte gUnknown_089E857C + 0xd08
    .4byte gUnknown_089E857C + 0xd24
    .4byte gUnknown_089E857C + 0xd28
    .4byte gUnknown_089E857C + 0xd2c
    .4byte gUnknown_089E857C + 0xd30
    .4byte gUnknown_089ED6AC + 0x31f
    .4byte gUnknown_089ED6AC + 0x804
    .4byte gUnknown_088B3AD8 + 0x4a68
    .4byte gUnknown_088B3AD8 + 0x4a68
    .4byte gUnknown_088B3AD8 + 0x51d4
    .4byte gUnknown_088B3AD8 + 0x54f4
    .4byte gUnknown_088B3AD8 + 0x5814
    .4byte gUnknown_088B3AD8 + 0x529c
    .4byte gUnknown_088B3AD8 + 0x55bc
    .4byte gUnknown_088B3AD8 + 0x58dc
    .4byte gUnknown_089F36A0 + 0xafc
    .4byte gUnknown_089F36A0 + 0xd58
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x1804
    .4byte 0x00000009
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x18a0
    .4byte 0x00000504
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x18b8
    .4byte 0x00000008
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x18d0
    .4byte 0x0000000c
    .4byte 0x00000000
    .4byte 0x000a0003
    .4byte gUnknown_089F36A0 + 0x17b4
    .4byte 0x00001901
    .4byte 0x00000000
    .4byte 0x000b0003
    .4byte gUnknown_089F36A0 + 0x17dc
    .4byte 0x00001a19
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000007
    .4byte 0x00000050
    .4byte 0x00140803
    .4byte 0x00000007
    .4byte 0x00000096
    .4byte 0x00140b0c
    .4byte 0x00000007
    .4byte 0x0000005d
    .4byte 0x00140511
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120b04
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120d11
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120d12
    .4byte 0x00000000
    .4byte 0x00030001
    .4byte gUnknown_089F36A0 + 0x13dc
    .4byte 0x00000006
    .4byte 0x0007000b
    .4byte gUnknown_089F36A0 + 0x181c
    .4byte 0x0a15020e
    .4byte 0x0008000b
    .4byte gUnknown_089F36A0 + 0x1840
    .4byte 0x11150b0c
    .4byte 0x0009000b
    .4byte gUnknown_089F36A0 + 0x187c
    .4byte 0x0a050601
    .4byte 0x0009000b
    .4byte gUnknown_089F36A0 + 0x187c
    .4byte 0x0c080806
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000

	.global Ch11EirikaEvents
Ch11EirikaEvents: @0x89e9400
    .4byte gUnknown_089E857C + 0xd84
    .4byte gUnknown_089E857C + 0xdb8
    .4byte gUnknown_089E857C + 0xddc
    .4byte gUnknown_089E857C + 0xe28
    .4byte gUnknown_089E857C + 0xe74
    .4byte gUnknown_089E857C + 0xe78
    .4byte gUnknown_089E857C + 0xe7c
    .4byte gUnknown_089E857C + 0xe80
    .4byte gUnknown_089ED6AC + 0x333
    .4byte gUnknown_089ED6AC + 0x806
    .4byte gUnknown_088B3AD8 + 0x5dbc
    .4byte gUnknown_088B3AD8 + 0x5dbc
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0x1258
    .4byte gUnknown_089F36A0 + 0x13dc
    .4byte 0x00070002
    .4byte gUnknown_089F36A0 + 0x1e00
    .4byte 0x0000ff01
    .4byte 0x00080002
    .4byte gUnknown_089F36A0 + 0x1e44
    .4byte 0x0000ff01
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000005
    .4byte gUnknown_089F36A0 + 0x1ccc
    .4byte 0x00100a06
    .4byte 0x00000005
    .4byte gUnknown_089F36A0 + 0x1d0c
    .4byte 0x00100c05
    .4byte 0x0000000a
    .4byte gUnknown_089ED6AC + 0x17a
    .4byte 0x00170611
    .4byte 0x00000000
    .4byte 0x00030001
    .4byte gUnknown_089F36A0 + 0x1b10
    .4byte 0x00000006
    .4byte 0x0009000b
    .4byte gUnknown_089F36A0 + 0x1de4
    .4byte 0x09130008
    .4byte 0x000a000b
    .4byte gUnknown_089F36A0 + 0x1e28
    .4byte 0x0f130a00
    .4byte 0x000a000b
    .4byte gUnknown_089F36A0 + 0x1e28
    .4byte 0x09070000
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000

	.global Ch12EirikaEventData
Ch12EirikaEventData: @0x89e94e8
    .4byte gUnknown_089E857C + 0xed4
    .4byte gUnknown_089E857C + 0xef0
    .4byte gUnknown_089E857C + 0xef4
    .4byte gUnknown_089E857C + 0xf1c
    .4byte gUnknown_089E857C + 0xf5c
    .4byte gUnknown_089E857C + 0xf60
    .4byte gUnknown_089E857C + 0xf64
    .4byte gUnknown_089E857C + 0xf68
    .4byte gUnknown_089ED6AC + 0x335
    .4byte gUnknown_089ED6AC + 0x808
    .4byte gUnknown_088B3AD8 + 0x6698
    .4byte gUnknown_088B3AD8 + 0x6698
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0x18e8
    .4byte gUnknown_089F36A0 + 0x1b10
    .4byte 0x00030002
    .4byte gUnknown_089F36A0 + 0x20f8
    .4byte 0x0000000c
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x23a8
    .4byte 0x00000009
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x23f0
    .4byte 0x00000905
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x2434
    .4byte 0x00000002
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x244c
    .4byte 0x00000503
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x2464
    .4byte 0x00000005
    .4byte 0x00000000
    .4byte 0x00070003
    .4byte gUnknown_089F36A0 + 0x232c
    .4byte 0x00001201
    .4byte 0x00000000
    .4byte 0x00070003
    .4byte gUnknown_089F36A0 + 0x2358
    .4byte 0x00001204
    .4byte 0x00000000
    .4byte 0x00080003
    .4byte gUnknown_089F36A0 + 0x2380
    .4byte 0x00000e01
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00030001
    .4byte gUnknown_089F36A0 + 0x20f8
    .4byte 0x00000002
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000

	.global Ch13EirikaEvents
Ch13EirikaEvents: @0x89e95e8
    .4byte gUnknown_089E857C + 0xfbc
    .4byte gUnknown_089E857C + 0x1008
    .4byte gUnknown_089E857C + 0x103c
    .4byte gUnknown_089E857C + 0x1040
    .4byte gUnknown_089E857C + 0x105c
    .4byte gUnknown_089E857C + 0x1060
    .4byte gUnknown_089E857C + 0x1064
    .4byte gUnknown_089E857C + 0x1068
    .4byte gUnknown_089ED6AC + 0x336
    .4byte gUnknown_089ED6AC + 0x809
    .4byte gUnknown_088B3AD8 + 0x6e70
    .4byte gUnknown_088B3AD8 + 0x6e70
    .4byte gUnknown_088B3AD8 + 0x7640
    .4byte gUnknown_088B3AD8 + 0x78fc
    .4byte gUnknown_088B3AD8 + 0x7bb8
    .4byte gUnknown_088B3AD8 + 0x7708
    .4byte gUnknown_088B3AD8 + 0x79c4
    .4byte gUnknown_088B3AD8 + 0x7c80
    .4byte gUnknown_089F36A0 + 0x1e8c
    .4byte gUnknown_089F36A0 + 0x20f8
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x2b98
    .4byte 0x00000805
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x2bb0
    .4byte 0x00000806
    .4byte 0x000e0002
    .4byte gUnknown_089F36A0 + 0x2c1c
    .4byte 0x0000ff01
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x2624
    .4byte 0x00800001
    .4byte 0x000c0002
    .4byte gUnknown_089F36A0 + 0x2be4
    .4byte 0x0000ff01
    .4byte 0x00000000
    .4byte 0x00080003
    .4byte gUnknown_089F36A0 + 0x2afc
    .4byte 0x00001c19
    .4byte 0x00000000
    .4byte 0x00080003
    .4byte gUnknown_089F36A0 + 0x2b24
    .4byte 0x00001c01
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00030005
    .4byte 0x00000001
    .4byte 0x00110509
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00121311
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120e0a
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00121302
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00121116
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120816
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120212
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120211
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00121809
    .4byte 0x00000007
    .4byte 0x00000057
    .4byte 0x00140316
    .4byte 0x00000007
    .4byte 0x0000008d
    .4byte 0x00141408
    .4byte 0x00000007
    .4byte 0x0000001d
    .4byte 0x00140516
    .4byte 0x0000000a
    .4byte gUnknown_089ED6AC + 0x192
    .4byte 0x00180404
    .4byte 0x00000007
    .4byte 0x0000005c
    .4byte 0x0014140a
    .4byte 0x00000007
    .4byte 0x00000068
    .4byte 0x00141012
    .4byte 0x00000007
    .4byte 0x27100077
    .4byte 0x00141002
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120114
    .4byte 0x00000000
    .4byte 0x000a000b
    .4byte gUnknown_089F36A0 + 0x2c50
    .4byte 0x0b130903
    .4byte 0x000d000b
    .4byte gUnknown_089F36A0 + 0x2bfc
    .4byte 0x07050000
    .4byte 0x000b000b
    .4byte gUnknown_089F36A0 + 0x2bc8
    .4byte 0x180d1300
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000

	.global Ch14EirikaEvents
Ch14EirikaEvents: @0x89e97b0
    .4byte gUnknown_089E857C + 0x10bc
    .4byte gUnknown_089E857C + 0x10fc
    .4byte gUnknown_089E857C + 0x1120
    .4byte gUnknown_089E857C + 0x11f0
    .4byte gUnknown_089E857C + 0x1224
    .4byte gUnknown_089E857C + 0x1228
    .4byte gUnknown_089E857C + 0x122c
    .4byte gUnknown_089E857C + 0x1230
    .4byte gUnknown_089ED6AC + 0x34c
    .4byte gUnknown_089ED6AC + 0x80d
    .4byte gUnknown_088B3AD8 + 0x80d0
    .4byte gUnknown_088B3AD8 + 0x80d0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0x249c
    .4byte gUnknown_089F36A0 + 0x2718
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x3078
    .4byte 0x00000503
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x3090
    .4byte 0x00000504
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x30a8
    .4byte 0x00000908
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x2d64
    .4byte 0x00800002
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x30d0
    .4byte 0x00000008
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x30e8
    .4byte 0x00000604
    .4byte 0x00000000
    .4byte 0x000d0003
    .4byte gUnknown_089F36A0 + 0x2fb4
    .4byte 0x00000f01
    .4byte 0x00000000
    .4byte 0x000d0003
    .4byte gUnknown_089F36A0 + 0x2fb4
    .4byte 0x0000010f
    .4byte 0x00000000
    .4byte 0x000e0003
    .4byte gUnknown_089F36A0 + 0x2fd8
    .4byte 0x0000020f
    .4byte 0x00000000
    .4byte 0x000e0003
    .4byte gUnknown_089F36A0 + 0x2fd8
    .4byte 0x00000f02
    .4byte 0x00000000
    .4byte 0x000f0003
    .4byte gUnknown_089F36A0 + 0x2ff8
    .4byte 0x0000100f
    .4byte 0x00000000
    .4byte 0x000f0003
    .4byte gUnknown_089F36A0 + 0x2ff8
    .4byte 0x00000f10
    .4byte 0x00000000
    .4byte 0x00100003
    .4byte gUnknown_089F36A0 + 0x3018
    .4byte 0x0000110f
    .4byte 0x00000000
    .4byte 0x00100003
    .4byte gUnknown_089F36A0 + 0x3018
    .4byte 0x00000f11
    .4byte 0x00000000
    .4byte 0x00110003
    .4byte gUnknown_089F36A0 + 0x3038
    .4byte 0x00000b0f
    .4byte 0x00000000
    .4byte 0x00110003
    .4byte gUnknown_089F36A0 + 0x3038
    .4byte 0x00000f0b
    .4byte 0x00000000
    .4byte 0x00120003
    .4byte gUnknown_089F36A0 + 0x3058
    .4byte 0x00000e1d
    .4byte 0x00000000
    .4byte 0x00120003
    .4byte gUnknown_089F36A0 + 0x3058
    .4byte 0x00001d0e
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000006
    .4byte gUnknown_089F36A0 + 0x2f28
    .4byte 0x00100e01
    .4byte 0x00000005
    .4byte 0x00000001
    .4byte 0x00200d01
    .4byte 0x0000000a
    .4byte gUnknown_089ED6AC + 0x1b4
    .4byte 0x00170408
    .4byte 0x00000005
    .4byte gUnknown_089F36A0 + 0x2f64
    .4byte 0x00100611
    .4byte 0x00000005
    .4byte gUnknown_089F36A0 + 0x2f8c
    .4byte 0x00100d05
    .4byte 0x00000000
    .4byte 0x00030001
    .4byte gUnknown_089F36A0 + 0x2dd0
    .4byte 0x00000006
    .4byte 0x0015000b
    .4byte gUnknown_089F36A0 + 0x31b8
    .4byte 0x0a170714
    .4byte 0x0016000b
    .4byte gUnknown_089F36A0 + 0x31fc
    .4byte 0x02020000
    .4byte 0x0019000b
    .4byte gUnknown_089F36A0 + 0x32c8
    .4byte 0x02160012
    .4byte 0x0018000b
    .4byte gUnknown_089F36A0 + 0x3284
    .4byte 0x0b010900
    .4byte 0x0013000b
    .4byte gUnknown_089F36A0 + 0x3130
    .4byte 0x0c090905
    .4byte 0x001b000b
    .4byte gUnknown_089F36A0 + 0x330c
    .4byte 0x0f0a0e08
    .4byte 0x0014000b
    .4byte gUnknown_089F36A0 + 0x3174
    .4byte 0x0d120b0e
    .4byte 0x0017000b
    .4byte gUnknown_089F36A0 + 0x3240
    .4byte 0x15170f16
    .4byte 0x001a000b
    .4byte gUnknown_089F36A0 + 0x3100
    .4byte 0x150e110b
    .4byte 0x001a000b
    .4byte gUnknown_089F36A0 + 0x3100
    .4byte 0x15150e0f
    .4byte 0x001c000b
    .4byte gUnknown_089F36A0 + 0x3350
    .4byte 0x07000400
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000

	.global Ch15EirikaEvents
Ch15EirikaEvents: @0x89e9a00
    .4byte gUnknown_089E857C + 0x1284
    .4byte gUnknown_089E857C + 0x12d0
    .4byte gUnknown_089E857C + 0x1394
    .4byte gUnknown_089E857C + 0x13d4
    .4byte gUnknown_089E857C + 0x1474
    .4byte gUnknown_089E857C + 0x1478
    .4byte gUnknown_089E857C + 0x147c
    .4byte gUnknown_089E857C + 0x1480
    .4byte gUnknown_089ED6AC + 0x350
    .4byte gUnknown_089ED6AC + 0x811
    .4byte gUnknown_088B3AD8 + 0x8b38
    .4byte gUnknown_088B3AD8 + 0x8b38
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0x2ca4
    .4byte gUnknown_089F36A0 + 0x2dd0
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x3eb8
    .4byte 0x0000000c
    .4byte 0x000c0002
    .4byte gUnknown_089F36A0 + 0x3f04
    .4byte 0x0000ff01
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x3f50
    .4byte 0x00000f0d
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00030005
    .4byte 0x00000001
    .4byte 0x0011030d
    .4byte 0x00000007
    .4byte 0x13880077
    .4byte 0x00140514
    .4byte 0x00000007
    .4byte 0x00000065
    .4byte 0x00140314
    .4byte 0x00000007
    .4byte 0x00000029
    .4byte 0x00140c03
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120401
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120304
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120a03
    .4byte 0x00000007
    .4byte 0x00000061
    .4byte 0x00140114
    .4byte 0x00000000
    .4byte 0x000b000b
    .4byte gUnknown_089F36A0 + 0x3ed0
    .4byte 0x0b150002
    .4byte 0x000b000b
    .4byte gUnknown_089F36A0 + 0x3ed0
    .4byte 0x160d1201
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000

	.global Ch16EirEvents
Ch16EirEvents: @0x89e9b18
    .4byte gUnknown_089E857C + 0x14d4
    .4byte gUnknown_089E857C + 0x14fc
    .4byte gUnknown_089E857C + 0x1500
    .4byte gUnknown_089E857C + 0x1564
    .4byte gUnknown_089E857C + 0x158c
    .4byte gUnknown_089E857C + 0x1590
    .4byte gUnknown_089E857C + 0x1594
    .4byte gUnknown_089E857C + 0x1598
    .4byte gUnknown_089ED6AC + 0x351
    .4byte gUnknown_089ED6AC + 0x812
    .4byte gUnknown_088B3AD8 + 0x9380
    .4byte gUnknown_088B3AD8 + 0x9380
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0x3394
    .4byte gUnknown_089F36A0 + 0x37a0
    .4byte 0x000e0002
    .4byte gUnknown_089F36A0 + 0x4704
    .4byte 0x0000ff01
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x4684
    .4byte 0x00000004
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x4684
    .4byte 0x00000006
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x4684
    .4byte 0x00000008
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x46b4
    .4byte 0x00000004
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x46b4
    .4byte 0x00000006
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x46b4
    .4byte 0x00000008
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x46cc
    .4byte 0x0000000a
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x46cc
    .4byte 0x0000000c
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x469c
    .4byte 0x00000003
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x469c
    .4byte 0x00000005
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x469c
    .4byte 0x00000007
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x469c
    .4byte 0x00000009
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x469c
    .4byte 0x0000000b
    .4byte 0x00000000
    .4byte 0x00090003
    .4byte gUnknown_089F36A0 + 0x4634
    .4byte 0x00002122
    .4byte 0x00000000
    .4byte 0x00090003
    .4byte gUnknown_089F36A0 + 0x460c
    .4byte 0x0000210b
    .4byte 0x00000000
    .4byte 0x00090003
    .4byte gUnknown_089F36A0 + 0x465c
    .4byte 0x00002106
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000000a
    .4byte gUnknown_089ED6AC + 0x1ce
    .4byte 0x00171401
    .4byte 0x0000000a
    .4byte gUnknown_089ED6AC + 0x1e8
    .4byte 0x0016020c
    .4byte 0x00000000
    .4byte 0x00030001
    .4byte gUnknown_089F36A0 + 0x4324
    .4byte 0x00000002
    .4byte 0x000d000b
    .4byte gUnknown_089F36A0 + 0x46e4
    .4byte 0x09160011
    .4byte 0x000f000b
    .4byte gUnknown_089F36A0 + 0x4738
    .4byte 0x08100009
    .4byte 0x000f000b
    .4byte gUnknown_089F36A0 + 0x4738
    .4byte 0x10130a0f
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000

	.global Ch17EirikaEvents
Ch17EirikaEvents: @0x89e9cb4
    .4byte gUnknown_089E857C + 0x15ec
    .4byte gUnknown_089E857C + 0x1698
    .4byte gUnknown_089E857C + 0x16cc
    .4byte gUnknown_089E857C + 0x16e8
    .4byte gUnknown_089E857C + 0x1728
    .4byte gUnknown_089E857C + 0x172c
    .4byte gUnknown_089E857C + 0x1730
    .4byte gUnknown_089E857C + 0x1734
    .4byte gUnknown_089ED6AC + 0x357
    .4byte gUnknown_089ED6AC + 0x818
    .4byte gUnknown_088B3AD8 + 0xa380
    .4byte gUnknown_088B3AD8 + 0xa380
    .4byte gUnknown_088B3AD8 + 0xaad8
    .4byte gUnknown_088B3AD8 + 0xadf8
    .4byte gUnknown_088B3AD8 + 0xb118
    .4byte gUnknown_088B3AD8 + 0xaba0
    .4byte gUnknown_088B3AD8 + 0xaec0
    .4byte gUnknown_088B3AD8 + 0xb1e0
    .4byte gUnknown_089F36A0 + 0x3f68
    .4byte gUnknown_089F36A0 + 0x4324
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x4b1c
    .4byte 0x0000ff01
    .4byte 0x00080002
    .4byte gUnknown_089F36A0 + 0x4b60
    .4byte 0x0000ff01
    .4byte 0x000a0002
    .4byte gUnknown_089F36A0 + 0x4b94
    .4byte 0x0000ff01
    .4byte 0x000c0002
    .4byte gUnknown_089F36A0 + 0x4bc8
    .4byte 0x0000ff01
    .4byte 0x000e0002
    .4byte gUnknown_089F36A0 + 0x4c0c
    .4byte 0x0000ff01
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00030001
    .4byte gUnknown_089F36A0 + 0x48e8
    .4byte 0x00000006
    .4byte 0x0007000b
    .4byte gUnknown_089F36A0 + 0x4b44
    .4byte 0x1b16140e
    .4byte 0x000b000b
    .4byte gUnknown_089F36A0 + 0x4bac
    .4byte 0x0a160010
    .4byte 0x0009000b
    .4byte gUnknown_089F36A0 + 0x4b78
    .4byte 0x13160e13
    .4byte 0x000d000b
    .4byte gUnknown_089F36A0 + 0x4bf0
    .4byte 0x080d0004
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000

	.global Ch18EirikaEvents
Ch18EirikaEvents: @0x89e9da8
    .4byte gUnknown_089E857C + 0x1788
    .4byte gUnknown_089E857C + 0x17c8
    .4byte gUnknown_089E857C + 0x17cc
    .4byte gUnknown_089E857C + 0x17d0
    .4byte gUnknown_089E857C + 0x181c
    .4byte gUnknown_089E857C + 0x1820
    .4byte gUnknown_089E857C + 0x1824
    .4byte gUnknown_089E857C + 0x1828
    .4byte gUnknown_089ED6AC + 0x358
    .4byte gUnknown_089ED6AC + 0x819
    .4byte gUnknown_088B3AD8 + 0xb510
    .4byte gUnknown_088B3AD8 + 0xb510
    .4byte gUnknown_088B3AD8 + 0xbbdc
    .4byte gUnknown_088B3AD8 + 0xbf88
    .4byte gUnknown_088B3AD8 + 0xc334
    .4byte gUnknown_088B3AD8 + 0xbc90
    .4byte gUnknown_088B3AD8 + 0xc03c
    .4byte gUnknown_088B3AD8 + 0xc3e8
    .4byte gUnknown_089F36A0 + 0x479c
    .4byte gUnknown_089F36A0 + 0x48e8
    .4byte 0x00030002
    .4byte gUnknown_089F36A0 + 0x4fd8
    .4byte 0x0000000e
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x529c
    .4byte 0x00000006
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x52b4
    .4byte 0x00000706
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x52cc
    .4byte 0x00000703
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x5300
    .4byte 0x00000804
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x5334
    .4byte 0x00000c08
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x5368
    .4byte 0x00000d09
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x539c
    .4byte 0x00000903
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x53b4
    .4byte 0x00000802
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x4fa4
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000007
    .4byte 0x00000011
    .4byte 0x00140b02
    .4byte 0x00000007
    .4byte 0x00000049
    .4byte 0x00140b04
    .4byte 0x00000007
    .4byte 0x0000004f
    .4byte 0x00140a1b
    .4byte 0x00000007
    .4byte 0x13880077
    .4byte 0x00140c1b
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120f03
    .4byte 0x0000000a
    .4byte gUnknown_089ED6AC + 0x20c
    .4byte 0x0018071a
    .4byte 0x00000007
    .4byte 0x0000005e
    .4byte 0x00140c03
    .4byte 0x00000007
    .4byte 0x0000003b
    .4byte 0x00140e1b
    .4byte 0x00000000
    .4byte 0x00030001
    .4byte gUnknown_089F36A0 + 0x4fd8
    .4byte 0x00000002
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000

	.global Ch19EirikaEvents
Ch19EirikaEvents: @0x89e9f08
    .4byte gUnknown_089E857C + 0x187c
    .4byte gUnknown_089E857C + 0x18f8
    .4byte gUnknown_089E857C + 0x18fc
    .4byte gUnknown_089E857C + 0x1960
    .4byte gUnknown_089E857C + 0x197c
    .4byte gUnknown_089E857C + 0x1980
    .4byte gUnknown_089E857C + 0x1984
    .4byte gUnknown_089E857C + 0x1988
    .4byte gUnknown_089ED6AC + 0x4bb
    .4byte gUnknown_089ED6AC + 0x81a
    .4byte gUnknown_088B3AD8 + 0xc7b8
    .4byte gUnknown_088B3AD8 + 0xc7b8
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0x4c34
    .4byte gUnknown_089F36A0 + 0x4fd8
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x55c0
    .4byte 0x00800001
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x56fc
    .4byte 0x0000150f
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x5740
    .4byte 0x00001610
    .4byte 0x000a0002
    .4byte gUnknown_089F36A0 + 0x57a4
    .4byte 0x0000ff01
    .4byte 0x000c0002
    .4byte gUnknown_089F36A0 + 0x57f8
    .4byte 0x0000ff01
    .4byte 0x000e0002
    .4byte gUnknown_089F36A0 + 0x5880
    .4byte 0x0000ff01
    .4byte 0x00100002
    .4byte gUnknown_089F36A0 + 0x5908
    .4byte 0x0000ff01
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x59c4
    .4byte 0x00001d13
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x5a28
    .4byte 0x00000605
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00030005
    .4byte 0x00000001
    .4byte 0x00110b0b
    .4byte 0x00000000
    .4byte 0x0009000b
    .4byte gUnknown_089F36A0 + 0x5784
    .4byte 0x0d190011
    .4byte 0x000b000b
    .4byte gUnknown_089F36A0 + 0x57d8
    .4byte 0x06100007
    .4byte 0x000d000b
    .4byte gUnknown_089F36A0 + 0x5860
    .4byte 0x14100f07
    .4byte 0x000f000b
    .4byte gUnknown_089F36A0 + 0x58e8
    .4byte 0x0e100707
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000

	.global Ch20EirikaEvents
Ch20EirikaEvents: @0x89ea02c
    .4byte gUnknown_089E857C + 0x19dc
    .4byte gUnknown_089E857C + 0x1a4c
    .4byte gUnknown_089E857C + 0x1a50
    .4byte gUnknown_089E857C + 0x1a60
    .4byte gUnknown_089E857C + 0x1aa0
    .4byte gUnknown_089E857C + 0x1aa4
    .4byte gUnknown_089E857C + 0x1aa8
    .4byte gUnknown_089E857C + 0x1aac
    .4byte gUnknown_089ED6AC + 0x4bd
    .4byte gUnknown_089ED6AC + 0x81c
    .4byte gUnknown_088B3AD8 + 0xd29c
    .4byte gUnknown_088B3AD8 + 0xd29c
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0x53cc
    .4byte gUnknown_089F36A0 + 0x55ec
    .4byte 0x000d0002
    .4byte gUnknown_089F36A0 + 0x5da8
    .4byte 0x0000ff01
    .4byte 0x000b0002
    .4byte gUnknown_089F36A0 + 0x5d00
    .4byte 0x0000ff01
    .4byte 0x000c0002
    .4byte gUnknown_089F36A0 + 0x5d54
    .4byte 0x0000ff01
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00121304
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00121312
    .4byte 0x00000007
    .4byte 0x0000005b
    .4byte 0x00141215
    .4byte 0x00000007
    .4byte 0x00000088
    .4byte 0x00141202
    .4byte 0x00000000
    .4byte 0x00030001
    .4byte gUnknown_089F36A0 + 0x5c00
    .4byte 0x00000002
    .4byte 0x000a000b
    .4byte gUnknown_089F36A0 + 0x5d88
    .4byte 0x060c050a
    .4byte 0x0008000b
    .4byte gUnknown_089F36A0 + 0x5ce0
    .4byte 0x0c0b0700
    .4byte 0x0009000b
    .4byte gUnknown_089F36A0 + 0x5d34
    .4byte 0x0c16070c
    .4byte 0x000e000b
    .4byte gUnknown_089F36A0 + 0x5ddc
    .4byte 0x04150001
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000

	.global FinalEirikaEvents1
FinalEirikaEvents1: @0x89ea138
    .4byte gUnknown_089E857C + 0x1b00
    .4byte gUnknown_089E857C + 0x1b28
    .4byte gUnknown_089E857C + 0x1b2c
    .4byte gUnknown_089E857C + 0x1b60
    .4byte gUnknown_089E857C + 0x1bac
    .4byte gUnknown_089E857C + 0x1bb0
    .4byte gUnknown_089E857C + 0x1bb4
    .4byte gUnknown_089E857C + 0x1bb8
    .4byte gUnknown_089ED6AC + 0x4bf
    .4byte gUnknown_089ED6AC + 0x81e
    .4byte gUnknown_088B3AD8 + 0xdd44
    .4byte gUnknown_088B3AD8 + 0xdd44
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0x5a40
    .4byte gUnknown_089F36A0 + 0x5c00
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00030001
    .4byte gUnknown_089F36A0 + 0x6870
    .4byte 0x00000002
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000

	.global FinalEirikaEvents2
FinalEirikaEvents2: @0x89ea1c0
    .4byte gUnknown_089E857C + 0x1c0c
    .4byte gUnknown_089E857C + 0x1c10
    .4byte gUnknown_089E857C + 0x1c14
    .4byte gUnknown_089E857C + 0x1c18
    .4byte gUnknown_089E857C + 0x1c34
    .4byte gUnknown_089E857C + 0x1c38
    .4byte gUnknown_089E857C + 0x1c3c
    .4byte gUnknown_089E857C + 0x1c40
    .4byte gUnknown_089ED6AC + 0x4c0
    .4byte gUnknown_089ED6AC + 0x81f
    .4byte gUnknown_088B3AD8 + 0xe46c
    .4byte gUnknown_088B3AD8 + 0xe46c
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0x5e00
    .4byte gUnknown_089F36A0 + 0x6870
    .4byte 0x000c0002
    .4byte gUnknown_089F36A0 + 0x7094
    .4byte 0x0000ff01
    .4byte 0x00100002
    .4byte gUnknown_089F36A0 + 0x70d8
    .4byte 0x0000ff01
    .4byte 0x000e0002
    .4byte gUnknown_089F36A0 + 0x714c
    .4byte 0x0000ff01
    .4byte 0x00120002
    .4byte gUnknown_089F36A0 + 0x7040
    .4byte 0x0000ff01
    .4byte 0x00000000
    .4byte 0x00070003
    .4byte gUnknown_089F36A0 + 0x6f94
    .4byte 0x0000120f
    .4byte 0x00000000
    .4byte 0x00070003
    .4byte gUnknown_089F36A0 + 0x6fbc
    .4byte 0x00001204
    .4byte 0x00000000
    .4byte 0x00080003
    .4byte gUnknown_089F36A0 + 0x6ff0
    .4byte 0x0000220f
    .4byte 0x00000000
    .4byte 0x00080003
    .4byte gUnknown_089F36A0 + 0x6ff0
    .4byte 0x00000f22
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00110008
    .4byte 0x00000001
    .4byte 0x0012110c
    .4byte 0x00030005
    .4byte 0x00000001
    .4byte 0x00110716
    .4byte 0x00000007
    .4byte 0x00000050
    .4byte 0x00140107
    .4byte 0x00000007
    .4byte 0x09c40077
    .4byte 0x00140112
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x0012030c
    .4byte 0x00110008
    .4byte 0x00000001
    .4byte 0x0012110d
    .4byte 0x00110008
    .4byte 0x00000001
    .4byte 0x0012120c
    .4byte 0x00110008
    .4byte 0x00000001
    .4byte 0x0012120d
    .4byte 0x00000007
    .4byte 0x00000097
    .4byte 0x00140117
    .4byte 0x00000000
    .4byte 0x000f0001
    .4byte gUnknown_089F36A0 + 0x70c8
    .4byte 0x00000011
    .4byte 0x000d000b
    .4byte gUnknown_089F36A0 + 0x710c
    .4byte 0x04180306
    .4byte 0x000b000b
    .4byte gUnknown_089F36A0 + 0x7074
    .4byte 0x14111107
    .4byte 0x000a000b
    .4byte gUnknown_089F36A0 + 0x7014
    .4byte 0x10070a03
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000

	.global Ch9Events
Ch9Events: @0x89ea348
    .4byte gUnknown_089E857C + 0x1c94
    .4byte gUnknown_089E857C + 0x1cc8
    .4byte gUnknown_089E857C + 0x1d0c
    .4byte gUnknown_089E857C + 0x1d7c
    .4byte gUnknown_089E857C + 0x1dbc
    .4byte gUnknown_089E857C + 0x1dc0
    .4byte gUnknown_089E857C + 0x1dc4
    .4byte gUnknown_089E857C + 0x1dc8
    .4byte gUnknown_089ED6AC + 0x4c1
    .4byte gUnknown_089ED6AC + 0x820
    .4byte gUnknown_088B3AD8 + 0xe7f0
    .4byte gUnknown_088B3AD8 + 0xe7f0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0x6a98
    .4byte gUnknown_089F36A0 + 0x6e40
    .4byte 0x00030002
    .4byte gUnknown_089F36A0 + 0x7580
    .4byte 0x0000000b
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x797c
    .4byte 0x00000803
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x7994
    .4byte 0x00000004
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x79bc
    .4byte 0x00000006
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x7424
    .4byte 0x00800001
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x74dc
    .4byte 0x00800002
    .4byte 0x00000000
    .4byte 0x00070003
    .4byte gUnknown_089F36A0 + 0x783c
    .4byte 0x00001d0f
    .4byte 0x00000000
    .4byte 0x00080003
    .4byte gUnknown_089F36A0 + 0x7864
    .4byte 0x00000e1d
    .4byte 0x00000000
    .4byte 0x00080003
    .4byte gUnknown_089F36A0 + 0x788c
    .4byte 0x00000e22
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000a0006
    .4byte gUnknown_089F36A0 + 0x78b4
    .4byte 0x00100209
    .4byte 0x000a0005
    .4byte 0x00000001
    .4byte 0x00200109
    .4byte 0x0000000a
    .4byte gUnknown_089ED6AC + 0x21e
    .4byte 0x00160e09
    .4byte 0x0000000a
    .4byte gUnknown_089ED6AC + 0x236
    .4byte 0x00170e08
    .4byte 0x00000005
    .4byte gUnknown_089F36A0 + 0x7954
    .4byte 0x00100105
    .4byte 0x00000005
    .4byte gUnknown_089F36A0 + 0x792c
    .4byte 0x00100006
    .4byte 0x000b0006
    .4byte gUnknown_089F36A0 + 0x78f0
    .4byte 0x00100c04
    .4byte 0x000b0005
    .4byte 0x00000001
    .4byte 0x00200b04
    .4byte 0x00000000
    .4byte 0x00030001
    .4byte gUnknown_089F36A0 + 0x7580
    .4byte 0x00000002
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000

	.global Ch10EphraimEvents
Ch10EphraimEvents: @0x89ea4a8
    .4byte gUnknown_089E857C + 0x1e1c
    .4byte gUnknown_089E857C + 0x1e68
    .4byte gUnknown_089E857C + 0x1e9c
    .4byte gUnknown_089E857C + 0x1f00
    .4byte gUnknown_089E857C + 0x1f1c
    .4byte gUnknown_089E857C + 0x1f20
    .4byte gUnknown_089E857C + 0x1f24
    .4byte gUnknown_089E857C + 0x1f28
    .4byte gUnknown_089ED6AC + 0x4c4
    .4byte gUnknown_089ED6AC + 0x823
    .4byte gUnknown_088B3AD8 + 0xf17c
    .4byte gUnknown_088B3AD8 + 0xf17c
    .4byte gUnknown_088B3AD8 + 0xf974
    .4byte gUnknown_088B3AD8 + 0xfc1c
    .4byte gUnknown_088B3AD8 + 0xfec4
    .4byte gUnknown_088B3AD8 + 0xfa3c
    .4byte gUnknown_088B3AD8 + 0xfce4
    .4byte gUnknown_088B3AD8 + 0xff8c
    .4byte gUnknown_089F36A0 + 0x7180
    .4byte gUnknown_089F36A0 + 0x7580
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x7bb0
    .4byte 0x00000003
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x7bf4
    .4byte 0x00000005
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x7d44
    .4byte 0x00000604
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x7d5c
    .4byte 0x00000005
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x7da4
    .4byte 0x00000004
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x7b44
    .4byte 0x00000002
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x7db8
    .4byte 0x00000004
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x7e08
    .4byte 0x00000005
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x7de0
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00070003
    .4byte gUnknown_089F36A0 + 0x7cf4
    .4byte 0x0000190f
    .4byte 0x00000000
    .4byte 0x00080003
    .4byte gUnknown_089F36A0 + 0x7d1c
    .4byte 0x00001a19
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00030001
    .4byte gUnknown_089F36A0 + 0x7c78
    .4byte 0x00000006
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000

	.global Ch11EphraimEvents
Ch11EphraimEvents: @0x89ea5bc
    .4byte gUnknown_089E857C + 0x1f7c
    .4byte gUnknown_089E857C + 0x1fec
    .4byte gUnknown_089E857C + 0x2010
    .4byte gUnknown_089E857C + 0x2014
    .4byte gUnknown_089E857C + 0x2030
    .4byte gUnknown_089E857C + 0x2034
    .4byte gUnknown_089E857C + 0x2038
    .4byte gUnknown_089E857C + 0x203c
    .4byte gUnknown_089ED6AC + 0x4c6
    .4byte gUnknown_089ED6AC + 0x825
    .4byte gUnknown_088B3AD8 + 0x10378
    .4byte gUnknown_088B3AD8 + 0x10378
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0x79e4
    .4byte gUnknown_089F36A0 + 0x7c78
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x7fac
    .4byte 0x00800001
    .4byte 0x00080002
    .4byte gUnknown_089F36A0 + 0x7fd8
    .4byte 0x00000002
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x82f8
    .4byte 0x00000403
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x8310
    .4byte 0x00000604
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x8328
    .4byte 0x00000705
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x8340
    .4byte 0x00000a08
    .4byte 0x00000000
    .4byte 0x00070003
    .4byte gUnknown_089F36A0 + 0x826c
    .4byte 0x00001618
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000005
    .4byte gUnknown_089F36A0 + 0x82d0
    .4byte 0x00100906
    .4byte 0x0000000a
    .4byte gUnknown_089ED6AC + 0x24e
    .4byte 0x00170104
    .4byte 0x00000006
    .4byte gUnknown_089F36A0 + 0x8294
    .4byte 0x00100505
    .4byte 0x00000005
    .4byte 0x00000001
    .4byte 0x00200405
    .4byte 0x00000000
    .4byte 0x00030001
    .4byte gUnknown_089F36A0 + 0x80d0
    .4byte 0x00000002
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    
	.global Ch12EphraimEvents
Ch12EphraimEvents: @0x89ea6cc
    .4byte gUnknown_089E857C + 0x2090
    .4byte gUnknown_089E857C + 0x20dc
    .4byte gUnknown_089E857C + 0x20f0
    .4byte gUnknown_089E857C + 0x2124
    .4byte gUnknown_089E857C + 0x2140
    .4byte gUnknown_089E857C + 0x2144
    .4byte gUnknown_089E857C + 0x2148
    .4byte gUnknown_089E857C + 0x214c
    .4byte gUnknown_089ED6AC + 0x4c8
    .4byte gUnknown_089ED6AC + 0x827
    .4byte gUnknown_088B3AD8 + 0x10be0
    .4byte gUnknown_088B3AD8 + 0x10be0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0x7e34
    .4byte gUnknown_089F36A0 + 0x80d0
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x8768
    .4byte 0x00000807
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x8780
    .4byte 0x00000403
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x8798
    .4byte 0x00000503
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x87b0
    .4byte 0x00000603
    .4byte 0x00000000
    .4byte 0x00090003
    .4byte gUnknown_089F36A0 + 0x868c
    .4byte 0x0000140f
    .4byte 0x00000000
    .4byte 0x00090003
    .4byte gUnknown_089F36A0 + 0x868c
    .4byte 0x00000f14
    .4byte 0x00000000
    .4byte 0x000a0003
    .4byte gUnknown_089F36A0 + 0x86b0
    .4byte 0x00001614
    .4byte 0x00000000
    .4byte 0x000a0003
    .4byte gUnknown_089F36A0 + 0x86b0
    .4byte 0x00001416
    .4byte 0x00000000
    .4byte 0x000b0003
    .4byte gUnknown_089F36A0 + 0x86d0
    .4byte 0x00001815
    .4byte 0x00000000
    .4byte 0x000b0003
    .4byte gUnknown_089F36A0 + 0x86d0
    .4byte 0x00001518
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000006
    .4byte gUnknown_089F36A0 + 0x86f0
    .4byte 0x00101204
    .4byte 0x00000005
    .4byte 0x00000001
    .4byte 0x00201104
    .4byte 0x00000006
    .4byte gUnknown_089F36A0 + 0x872c
    .4byte 0x00100d11
    .4byte 0x00000005
    .4byte 0x00000001
    .4byte 0x00200c11
    .4byte 0x00000000
    .4byte 0x00030001
    .4byte gUnknown_089F36A0 + 0x856c
    .4byte 0x00000006
    .4byte 0x000c0001
    .4byte gUnknown_089F36A0 + 0x87c8
    .4byte 0x00000002
    .4byte 0x0007000b
    .4byte gUnknown_089F36A0 + 0x85ec
    .4byte 0x0e0b0d09
    .4byte 0x0007000b
    .4byte gUnknown_089F36A0 + 0x85ec
    .4byte 0x0c0c0a08
    .4byte 0x0008000b
    .4byte gUnknown_089F36A0 + 0x863c
    .4byte 0x0e0b0d09
    .4byte 0x0008000b
    .4byte gUnknown_089F36A0 + 0x863c
    .4byte 0x0c0c0a08
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    
	.global Ch13EphraimEventData
Ch13EphraimEventData: @0x89ea850
    .4byte gUnknown_089E857C + 0x21a0
    .4byte gUnknown_089E857C + 0x21d4
    .4byte gUnknown_089E857C + 0x2238
    .4byte gUnknown_089E857C + 0x226c
    .4byte gUnknown_089E857C + 0x22c4
    .4byte gUnknown_089E857C + 0x22c8
    .4byte gUnknown_089E857C + 0x22cc
    .4byte gUnknown_089E857C + 0x22d0
    .4byte gUnknown_089ED6AC + 0x4c9
    .4byte gUnknown_089ED6AC + 0x828
    .4byte gUnknown_088B3AD8 + 0x113dc
    .4byte gUnknown_088B3AD8 + 0x113dc
    .4byte gUnknown_088B3AD8 + 0x11af8
    .4byte gUnknown_088B3AD8 + 0x11e04
    .4byte gUnknown_088B3AD8 + 0x12110
    .4byte gUnknown_088B3AD8 + 0x11bc0
    .4byte gUnknown_088B3AD8 + 0x11ecc
    .4byte gUnknown_088B3AD8 + 0x121d8
    .4byte gUnknown_089F36A0 + 0x8358
    .4byte gUnknown_089F36A0 + 0x856c
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x8f00
    .4byte 0x00000002
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x8f20
    .4byte 0x00000002
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x8f48
    .4byte 0x00000003
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x8f70
    .4byte 0x00000004
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x8f98
    .4byte 0x00000907
    .4byte 0x000d0002
    .4byte gUnknown_089F36A0 + 0x8ff0
    .4byte 0x0000ff01
    .4byte 0x00100002
    .4byte gUnknown_089F36A0 + 0x905c
    .4byte 0x0000ff01
    .4byte 0x00000000
    .4byte 0x00090003
    .4byte gUnknown_089F36A0 + 0x8e80
    .4byte 0x00001c19
    .4byte 0x00000000
    .4byte 0x00090003
    .4byte gUnknown_089F36A0 + 0x8e8c
    .4byte 0x00001c0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00030005
    .4byte 0x00000001
    .4byte 0x0011020e
    .4byte 0x000e0008
    .4byte 0x00000001
    .4byte 0x0012070d
    .4byte 0x000b0008
    .4byte 0x00000001
    .4byte 0x0012140d
    .4byte 0x00000007
    .4byte 0x00000068
    .4byte 0x0014120d
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120c06
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120c07
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120c08
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120d06
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120d07
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120d08
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120c14
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120c15
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120c16
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120d16
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120d15
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120d14
    .4byte 0x00000007
    .4byte 0x00000057
    .4byte 0x0014120f
    .4byte 0x0000000a
    .4byte gUnknown_089ED6AC + 0x266
    .4byte 0x00180f04
    .4byte 0x00000007
    .4byte 0x0000001d
    .4byte 0x0014011b
    .4byte 0x00000007
    .4byte 0x0000005b
    .4byte 0x00140103
    .4byte 0x00000007
    .4byte 0x27100077
    .4byte 0x0014120e
    .4byte 0x000b0008
    .4byte 0x00000001
    .4byte 0x0012140e
    .4byte 0x000b0008
    .4byte 0x00000001
    .4byte 0x0012140f
    .4byte 0x000b0008
    .4byte 0x00000001
    .4byte 0x0012150f
    .4byte 0x000b0008
    .4byte 0x00000001
    .4byte 0x0012150e
    .4byte 0x000b0008
    .4byte 0x00000001
    .4byte 0x0012150d
    .4byte 0x000e0008
    .4byte 0x00000001
    .4byte 0x0012070e
    .4byte 0x000e0008
    .4byte 0x00000001
    .4byte 0x0012070f
    .4byte 0x000e0008
    .4byte 0x00000001
    .4byte 0x0012080d
    .4byte 0x000e0008
    .4byte 0x00000001
    .4byte 0x0012080e
    .4byte 0x000e0008
    .4byte 0x00000001
    .4byte 0x0012080f
    .4byte 0x00000000
    .4byte 0x000c0001
    .4byte gUnknown_089F36A0 + 0x8fc0
    .4byte 0x0000000b
    .4byte 0x000f0001
    .4byte gUnknown_089F36A0 + 0x904c
    .4byte 0x0000000e
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    
	.global Ch14EphraimEventData
Ch14EphraimEventData: @0x89eaacc
    .4byte gUnknown_089E857C + 0x2324
    .4byte gUnknown_089E857C + 0x237c
    .4byte gUnknown_089E857C + 0x23a0
    .4byte gUnknown_089E857C + 0x2518
    .4byte gUnknown_089E857C + 0x2540
    .4byte gUnknown_089E857C + 0x2544
    .4byte gUnknown_089E857C + 0x2548
    .4byte gUnknown_089E857C + 0x254c
    .4byte gUnknown_089ED6AC + 0x4ca
    .4byte gUnknown_089ED6AC + 0x829
    .4byte gUnknown_088B3AD8 + 0x124e4
    .4byte gUnknown_088B3AD8 + 0x124e4
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0x87dc
    .4byte gUnknown_089F36A0 + 0x89cc
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x9394
    .4byte 0x00000503
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x93ac
    .4byte 0x00000504
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x93c4
    .4byte 0x00000908
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x93dc
    .4byte 0x00000008
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x93f4
    .4byte 0x00000604
    .4byte 0x00000000
    .4byte 0x000d0003
    .4byte gUnknown_089F36A0 + 0x92f0
    .4byte 0x0000010f
    .4byte 0x00000000
    .4byte 0x000d0003
    .4byte gUnknown_089F36A0 + 0x92f0
    .4byte 0x00000f01
    .4byte 0x00000000
    .4byte 0x000e0003
    .4byte gUnknown_089F36A0 + 0x9314
    .4byte 0x00000201
    .4byte 0x00000000
    .4byte 0x000e0003
    .4byte gUnknown_089F36A0 + 0x9314
    .4byte 0x00000102
    .4byte 0x00000000
    .4byte 0x000f0003
    .4byte gUnknown_089F36A0 + 0x9334
    .4byte 0x00002201
    .4byte 0x00000000
    .4byte 0x000f0003
    .4byte gUnknown_089F36A0 + 0x9334
    .4byte 0x00000122
    .4byte 0x00000000
    .4byte 0x00100003
    .4byte gUnknown_089F36A0 + 0x9354
    .4byte 0x0000220b
    .4byte 0x00000000
    .4byte 0x00100003
    .4byte gUnknown_089F36A0 + 0x9354
    .4byte 0x00000b22
    .4byte 0x00000000
    .4byte 0x00110003
    .4byte gUnknown_089F36A0 + 0x9374
    .4byte 0x00001817
    .4byte 0x00000000
    .4byte 0x00110003
    .4byte gUnknown_089F36A0 + 0x9374
    .4byte 0x00001718
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000006
    .4byte gUnknown_089F36A0 + 0x9264
    .4byte 0x00100e01
    .4byte 0x00000005
    .4byte 0x00000001
    .4byte 0x00200d01
    .4byte 0x0000000a
    .4byte gUnknown_089ED6AC + 0x288
    .4byte 0x00170408
    .4byte 0x00000005
    .4byte gUnknown_089F36A0 + 0x92a0
    .4byte 0x00100611
    .4byte 0x00000005
    .4byte gUnknown_089F36A0 + 0x92c8
    .4byte 0x00100d05
    .4byte 0x00000000
    .4byte 0x00030001
    .4byte gUnknown_089F36A0 + 0x9250
    .4byte 0x00000006
    .4byte 0x0014000b
    .4byte gUnknown_089F36A0 + 0x94c4
    .4byte 0x0a170714
    .4byte 0x0015000b
    .4byte gUnknown_089F36A0 + 0x9508
    .4byte 0x02020000
    .4byte 0x0018000b
    .4byte gUnknown_089F36A0 + 0x95d4
    .4byte 0x02160012
    .4byte 0x0017000b
    .4byte gUnknown_089F36A0 + 0x9590
    .4byte 0x0b010900
    .4byte 0x0012000b
    .4byte gUnknown_089F36A0 + 0x943c
    .4byte 0x0c090905
    .4byte 0x001a000b
    .4byte gUnknown_089F36A0 + 0x9618
    .4byte 0x0f0a0e08
    .4byte 0x0013000b
    .4byte gUnknown_089F36A0 + 0x9480
    .4byte 0x0d120b0e
    .4byte 0x0016000b
    .4byte gUnknown_089F36A0 + 0x954c
    .4byte 0x15170f16
    .4byte 0x0019000b
    .4byte gUnknown_089F36A0 + 0x940c
    .4byte 0x150e110b
    .4byte 0x0019000b
    .4byte gUnknown_089F36A0 + 0x940c
    .4byte 0x15150e0f
    .4byte 0x001b000b
    .4byte gUnknown_089F36A0 + 0x965c
    .4byte 0x07000400
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    
	.global Ch15EphraimEventData
Ch15EphraimEventData: @0x89eacf0
    .4byte gUnknown_089E857C + 0x25a0
    .4byte gUnknown_089E857C + 0x25e0
    .4byte gUnknown_089E857C + 0x2684
    .4byte gUnknown_089E857C + 0x26c4
    .4byte gUnknown_089E857C + 0x2764
    .4byte gUnknown_089E857C + 0x2768
    .4byte gUnknown_089E857C + 0x276c
    .4byte gUnknown_089E857C + 0x2770
    .4byte gUnknown_089ED6AC + 0x4ce
    .4byte gUnknown_089ED6AC + 0x82d
    .4byte gUnknown_088B3AD8 + 0x1333c
    .4byte gUnknown_088B3AD8 + 0x1333c
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0x90a0
    .4byte gUnknown_089F36A0 + 0x9250
    .4byte 0x000d0002
    .4byte gUnknown_089F36A0 + 0x97e0
    .4byte 0x0000ff01
    .4byte 0x000e0002
    .4byte gUnknown_089F36A0 + 0x9764
    .4byte 0x0000ff01
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x9720
    .4byte 0x00000010
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x9708
    .4byte 0x00000006
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00030005
    .4byte 0x00000001
    .4byte 0x0011030d
    .4byte 0x00000007
    .4byte 0x00000029
    .4byte 0x00140c03
    .4byte 0x00000007
    .4byte 0x00000061
    .4byte 0x00140114
    .4byte 0x00000007
    .4byte 0x00000065
    .4byte 0x00140314
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120401
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120a03
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120304
    .4byte 0x00000007
    .4byte 0x13880077
    .4byte 0x00140514
    .4byte 0x00000000
    .4byte 0x000b000b
    .4byte gUnknown_089F36A0 + 0x9738
    .4byte 0x03080000
    .4byte 0x000c000b
    .4byte gUnknown_089F36A0 + 0x97a8
    .4byte 0x0b150405
    .4byte 0x000c000b
    .4byte gUnknown_089F36A0 + 0x97a8
    .4byte 0x160d1201
    .4byte 0x000b000b
    .4byte gUnknown_089F36A0 + 0x9738
    .4byte 0x15150e0e
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    
	.global Ch16EphraimEventData
Ch16EphraimEventData: @0x89eae2c
    .4byte gUnknown_089E857C + 0x27c4
    .4byte gUnknown_089E857C + 0x27f8
    .4byte gUnknown_089E857C + 0x27fc
    .4byte gUnknown_089E857C + 0x2860
    .4byte gUnknown_089E857C + 0x28a0
    .4byte gUnknown_089E857C + 0x28a4
    .4byte gUnknown_089E857C + 0x28a8
    .4byte gUnknown_089E857C + 0x28ac
    .4byte gUnknown_089ED6AC + 0x4cf
    .4byte gUnknown_089ED6AC + 0x82e
    .4byte gUnknown_088B3AD8 + 0x13b70
    .4byte gUnknown_088B3AD8 + 0x13b70
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0x96a0
    .4byte gUnknown_089F36A0 + 0x96f8
    .4byte 0x000e0002
    .4byte gUnknown_089F36A0 + 0x98f0
    .4byte 0x0000ff01
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x9870
    .4byte 0x00000004
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x9870
    .4byte 0x00000006
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x9870
    .4byte 0x00000008
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x98a0
    .4byte 0x00000004
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x98a0
    .4byte 0x00000006
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x98a0
    .4byte 0x00000008
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x98b8
    .4byte 0x0000000a
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x98b8
    .4byte 0x0000000c
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x9888
    .4byte 0x00000003
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x9888
    .4byte 0x00000005
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x9888
    .4byte 0x00000007
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x9888
    .4byte 0x00000009
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x9888
    .4byte 0x0000000b
    .4byte 0x00000000
    .4byte 0x00090003
    .4byte gUnknown_089F36A0 + 0x9858
    .4byte 0x00002122
    .4byte 0x00000000
    .4byte 0x00090003
    .4byte gUnknown_089F36A0 + 0x984c
    .4byte 0x0000210b
    .4byte 0x00000000
    .4byte 0x00090003
    .4byte gUnknown_089F36A0 + 0x9864
    .4byte 0x00002106
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000000a
    .4byte gUnknown_089ED6AC + 0x2a2
    .4byte 0x00171401
    .4byte 0x0000000a
    .4byte gUnknown_089ED6AC + 0x2bc
    .4byte 0x0016020c
    .4byte 0x00000000
    .4byte 0x00030001
    .4byte gUnknown_089F36A0 + 0x983c
    .4byte 0x00000002
    .4byte 0x000d000b
    .4byte gUnknown_089F36A0 + 0x98d0
    .4byte 0x09160011
    .4byte 0x000f000b
    .4byte gUnknown_089F36A0 + 0x9924
    .4byte 0x08100009
    .4byte 0x000f000b
    .4byte gUnknown_089F36A0 + 0x9924
    .4byte 0x10130a0f
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000

	.global Ch17EphraimEventData
Ch17EphraimEventData: @0x89eafc8
    .4byte gUnknown_089E857C + 0x2900
    .4byte gUnknown_089E857C + 0x29ac
    .4byte gUnknown_089E857C + 0x29e0
    .4byte gUnknown_089E857C + 0x29fc
    .4byte gUnknown_089E857C + 0x2a3c
    .4byte gUnknown_089E857C + 0x2a40
    .4byte gUnknown_089E857C + 0x2a44
    .4byte gUnknown_089E857C + 0x2a48
    .4byte gUnknown_089ED6AC + 0x4d0
    .4byte gUnknown_089ED6AC + 0x82f
    .4byte gUnknown_088B3AD8 + 0x141c4
    .4byte gUnknown_088B3AD8 + 0x141c4
    .4byte gUnknown_088B3AD8 + 0x14610
    .4byte gUnknown_088B3AD8 + 0x14930
    .4byte gUnknown_088B3AD8 + 0x14c50
    .4byte gUnknown_088B3AD8 + 0x146d8
    .4byte gUnknown_088B3AD8 + 0x149f8
    .4byte gUnknown_088B3AD8 + 0x14d18
    .4byte gUnknown_089F36A0 + 0x9824
    .4byte gUnknown_089F36A0 + 0x983c
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x9bc8
    .4byte 0x0000ff01
    .4byte 0x00080002
    .4byte gUnknown_089F36A0 + 0x9c0c
    .4byte 0x0000ff01
    .4byte 0x000a0002
    .4byte gUnknown_089F36A0 + 0x9c40
    .4byte 0x0000ff01
    .4byte 0x000c0002
    .4byte gUnknown_089F36A0 + 0x9c74
    .4byte 0x0000ff01
    .4byte 0x000e0002
    .4byte gUnknown_089F36A0 + 0x9cb8
    .4byte 0x0000ff01
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00030001
    .4byte gUnknown_089F36A0 + 0x99c8
    .4byte 0x00000006
    .4byte 0x0007000b
    .4byte gUnknown_089F36A0 + 0x9bf0
    .4byte 0x1b16140e
    .4byte 0x000b000b
    .4byte gUnknown_089F36A0 + 0x9c58
    .4byte 0x0a160010
    .4byte 0x0009000b
    .4byte gUnknown_089F36A0 + 0x9c24
    .4byte 0x13160e13
    .4byte 0x000d000b
    .4byte gUnknown_089F36A0 + 0x9c9c
    .4byte 0x080d0004
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    
	.global Ch18EphraimEventData
Ch18EphraimEventData: @0x89eb0bc
    .4byte gUnknown_089E857C + 0x2a9c
    .4byte gUnknown_089E857C + 0x2adc
    .4byte gUnknown_089E857C + 0x2ae0
    .4byte gUnknown_089E857C + 0x2ae4
    .4byte gUnknown_089E857C + 0x2b30
    .4byte gUnknown_089E857C + 0x2b34
    .4byte gUnknown_089E857C + 0x2b38
    .4byte gUnknown_089E857C + 0x2b3c
    .4byte gUnknown_089ED6AC + 0x4d1
    .4byte gUnknown_089ED6AC + 0x830
    .4byte gUnknown_088B3AD8 + 0x15000
    .4byte gUnknown_088B3AD8 + 0x15000
    .4byte gUnknown_088B3AD8 + 0x1562c
    .4byte gUnknown_088B3AD8 + 0x159d8
    .4byte gUnknown_088B3AD8 + 0x15d84
    .4byte gUnknown_088B3AD8 + 0x156e0
    .4byte gUnknown_088B3AD8 + 0x15a8c
    .4byte gUnknown_088B3AD8 + 0x15e38
    .4byte gUnknown_089F36A0 + 0x9988
    .4byte gUnknown_089F36A0 + 0x99c8
    .4byte 0x00030002
    .4byte gUnknown_089F36A0 + 0x9d3c
    .4byte 0x0000000e
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x9d4c
    .4byte 0x00000006
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x9d64
    .4byte 0x00000706
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x9d7c
    .4byte 0x00000703
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x9db0
    .4byte 0x00000804
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x9de4
    .4byte 0x00000c08
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x9e18
    .4byte 0x00000d09
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x9e4c
    .4byte 0x00000903
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x9e64
    .4byte 0x00000802
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x9d08
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000007
    .4byte 0x00000011
    .4byte 0x00140b02
    .4byte 0x00000007
    .4byte 0x00000049
    .4byte 0x00140b04
    .4byte 0x00000007
    .4byte 0x0000004f
    .4byte 0x00140a1b
    .4byte 0x00000007
    .4byte 0x13880077
    .4byte 0x00140c1b
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120f03
    .4byte 0x0000000a
    .4byte gUnknown_089ED6AC + 0x2e0
    .4byte 0x0018071a
    .4byte 0x00000007
    .4byte 0x0000005e
    .4byte 0x00140c03
    .4byte 0x00000007
    .4byte 0x0000003b
    .4byte 0x00140e1b
    .4byte 0x00000000
    .4byte 0x00030001
    .4byte gUnknown_089F36A0 + 0x9d3c
    .4byte 0x00000002
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000

	.global Ch19EphraimEventData
Ch19EphraimEventData: @0x89eb21c
    .4byte gUnknown_089E857C + 0x2b90
    .4byte gUnknown_089E857C + 0x2c0c
    .4byte gUnknown_089E857C + 0x2c10
    .4byte gUnknown_089E857C + 0x2c74
    .4byte gUnknown_089E857C + 0x2c90
    .4byte gUnknown_089E857C + 0x2c94
    .4byte gUnknown_089E857C + 0x2c98
    .4byte gUnknown_089E857C + 0x2c9c
    .4byte gUnknown_089ED6AC + 0x634
    .4byte gUnknown_089ED6AC + 0x831
    .4byte gUnknown_088B3AD8 + 0x161d8
    .4byte gUnknown_088B3AD8 + 0x161d8
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0x9ce0
    .4byte gUnknown_089F36A0 + 0x9d3c
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x9ed8
    .4byte 0x00800001
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x9f90
    .4byte 0x0000150f
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0x9fd4
    .4byte 0x00001610
    .4byte 0x000a0002
    .4byte gUnknown_089F36A0 + 0xa038
    .4byte 0x0000ff01
    .4byte 0x000c0002
    .4byte gUnknown_089F36A0 + 0xa08c
    .4byte 0x0000ff01
    .4byte 0x000e0002
    .4byte gUnknown_089F36A0 + 0xa114
    .4byte 0x0000ff01
    .4byte 0x00100002
    .4byte gUnknown_089F36A0 + 0xa19c
    .4byte 0x0000ff01
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xa258
    .4byte 0x00001d13
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xa2bc
    .4byte 0x00000605
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00030005
    .4byte 0x00000001
    .4byte 0x00110b0b
    .4byte 0x00000000
    .4byte 0x0009000b
    .4byte gUnknown_089F36A0 + 0xa018
    .4byte 0x0d190011
    .4byte 0x000b000b
    .4byte gUnknown_089F36A0 + 0xa06c
    .4byte 0x06100007
    .4byte 0x000d000b
    .4byte gUnknown_089F36A0 + 0xa0f4
    .4byte 0x14100f07
    .4byte 0x000f000b
    .4byte gUnknown_089F36A0 + 0xa17c
    .4byte 0x0e100707
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000

	.global Ch20EphraimEventData
Ch20EphraimEventData: @0x89eb340
    .4byte gUnknown_089E857C + 0x2cf0
    .4byte gUnknown_089E857C + 0x2d60
    .4byte gUnknown_089E857C + 0x2d64
    .4byte gUnknown_089E857C + 0x2d74
    .4byte gUnknown_089E857C + 0x2db4
    .4byte gUnknown_089E857C + 0x2db8
    .4byte gUnknown_089E857C + 0x2dbc
    .4byte gUnknown_089E857C + 0x2dc0
    .4byte gUnknown_089ED6AC + 0x635
    .4byte gUnknown_089ED6AC + 0x832
    .4byte gUnknown_088B3AD8 + 0x16b64
    .4byte gUnknown_088B3AD8 + 0x16b64
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0x9e7c
    .4byte gUnknown_089F36A0 + 0x9ee4
    .4byte 0x000d0002
    .4byte gUnknown_089F36A0 + 0xa454
    .4byte 0x0000ff01
    .4byte 0x000b0002
    .4byte gUnknown_089F36A0 + 0xa3ac
    .4byte 0x0000ff01
    .4byte 0x000c0002
    .4byte gUnknown_089F36A0 + 0xa400
    .4byte 0x0000ff01
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00121304
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00121312
    .4byte 0x00000007
    .4byte 0x0000005b
    .4byte 0x00141215
    .4byte 0x00000007
    .4byte 0x00000088
    .4byte 0x00141202
    .4byte 0x00000000
    .4byte 0x00030001
    .4byte gUnknown_089F36A0 + 0xa318
    .4byte 0x00000002
    .4byte 0x000a000b
    .4byte gUnknown_089F36A0 + 0xa434
    .4byte 0x060c050a
    .4byte 0x0009000b
    .4byte gUnknown_089F36A0 + 0xa3e0
    .4byte 0x0c0b0700
    .4byte 0x0008000b
    .4byte gUnknown_089F36A0 + 0xa38c
    .4byte 0x0c16070c
    .4byte 0x000e000b
    .4byte gUnknown_089F36A0 + 0xa488
    .4byte 0x04150001
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    
	.global FinalEphraimEvents1
FinalEphraimEvents1: @0x89eb44c
    .4byte gUnknown_089E857C + 0x2e14
    .4byte gUnknown_089E857C + 0x2e3c
    .4byte gUnknown_089E857C + 0x2e40
    .4byte gUnknown_089E857C + 0x2e74
    .4byte gUnknown_089E857C + 0x2ec0
    .4byte gUnknown_089E857C + 0x2ec4
    .4byte gUnknown_089E857C + 0x2ec8
    .4byte gUnknown_089E857C + 0x2ecc
    .4byte gUnknown_089ED6AC + 0x636
    .4byte gUnknown_089ED6AC + 0x833
    .4byte gUnknown_088B3AD8 + 0x17588
    .4byte gUnknown_088B3AD8 + 0x17588
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0xa2d4
    .4byte gUnknown_089F36A0 + 0xa318
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00030001
    .4byte gUnknown_089F36A0 + 0xa4b8
    .4byte 0x00000002
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    
	.global FinalEphraimEvents2
FinalEphraimEvents2: @0x89eb4d4
    .4byte gUnknown_089E857C + 0x2f20
    .4byte gUnknown_089E857C + 0x2f24
    .4byte gUnknown_089E857C + 0x2f28
    .4byte gUnknown_089E857C + 0x2f2c
    .4byte gUnknown_089E857C + 0x2f48
    .4byte gUnknown_089E857C + 0x2f4c
    .4byte gUnknown_089E857C + 0x2f50
    .4byte gUnknown_089E857C + 0x2f54
    .4byte gUnknown_089ED6AC + 0x637
    .4byte gUnknown_089ED6AC + 0x834
    .4byte gUnknown_088B3AD8 + 0x17bc8
    .4byte gUnknown_088B3AD8 + 0x17bc8
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0xa4ac
    .4byte gUnknown_089F36A0 + 0xa4b8
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000000a
    .4byte gUnknown_089ED6AC + 0x2f2
    .4byte 0x00161100
    .4byte 0x0000000a
    .4byte gUnknown_089ED6AC + 0x2f6
    .4byte 0x00171101
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte gUnknown_089F36A0 + 0xa544
    .4byte 0x00000006
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000

	.global TowerOfValni1Events
TowerOfValni1Events: @0x89eb574
    .4byte gUnknown_089E857C + 0x2fa8
    .4byte gUnknown_089E857C + 0x2fac
    .4byte gUnknown_089E857C + 0x2fb0
    .4byte gUnknown_089E857C + 0x2fcc
    .4byte gUnknown_089E857C + 0x2fe8
    .4byte gUnknown_089E857C + 0x2fec
    .4byte gUnknown_089E857C + 0x2ff0
    .4byte gUnknown_089E857C + 0x2ff4
    .4byte gUnknown_089ED6AC + 0x638
    .4byte gUnknown_089ED6AC + 0x835
    .4byte gUnknown_088B3AD8 + 0x17bf0
    .4byte gUnknown_088B3AD8 + 0x17bf0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0xa4c8
    .4byte gUnknown_089F36A0 + 0xa544
    .4byte 0x00080002
    .4byte gUnknown_089F36A0 + 0xa658
    .4byte 0x0000ff01
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte gUnknown_089F36A0 + 0xa5f0
    .4byte 0x00000006
    .4byte 0x0007000b
    .4byte gUnknown_089F36A0 + 0xa624
    .4byte 0x11130111
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    
	.global TowerOfValni2Events
TowerOfValni2Events: @0x89eb614
    .4byte gUnknown_089E857C + 0x3048
    .4byte gUnknown_089E857C + 0x3058
    .4byte gUnknown_089E857C + 0x305c
    .4byte gUnknown_089E857C + 0x3060
    .4byte gUnknown_089E857C + 0x3088
    .4byte gUnknown_089E857C + 0x308c
    .4byte gUnknown_089E857C + 0x3090
    .4byte gUnknown_089E857C + 0x3094
    .4byte gUnknown_089ED6AC + 0x639
    .4byte gUnknown_089ED6AC + 0x836
    .4byte gUnknown_088B3AD8 + 0x17e40
    .4byte gUnknown_088B3AD8 + 0x17e40
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0xa578
    .4byte gUnknown_089F36A0 + 0xa5f0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000007
    .4byte 0x0bb80077
    .4byte 0x0014030a
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte gUnknown_089F36A0 + 0xa6e4
    .4byte 0x00000006
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000

	.global TowerOfValni3Events
TowerOfValni3Events: @0x89eb6a8
    .4byte gUnknown_089E857C + 0x30e8
    .4byte gUnknown_089E857C + 0x30ec
    .4byte gUnknown_089E857C + 0x30f0
    .4byte gUnknown_089E857C + 0x3100
    .4byte gUnknown_089E857C + 0x311c
    .4byte gUnknown_089E857C + 0x3120
    .4byte gUnknown_089E857C + 0x3124
    .4byte gUnknown_089E857C + 0x3128
    .4byte gUnknown_089ED6AC + 0x63a
    .4byte gUnknown_089ED6AC + 0x837
    .4byte gUnknown_088B3AD8 + 0x18160
    .4byte gUnknown_088B3AD8 + 0x18160
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0xa670
    .4byte gUnknown_089F36A0 + 0xa6e4
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte gUnknown_089F36A0 + 0xa79c
    .4byte 0x00000006
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    
	.global TowerOfValni4Events
TowerOfValni4Events: @0x89eb730
    .4byte gUnknown_089E857C + 0x317c
    .4byte gUnknown_089E857C + 0x3180
    .4byte gUnknown_089E857C + 0x3184
    .4byte gUnknown_089E857C + 0x3188
    .4byte gUnknown_089E857C + 0x31a4
    .4byte gUnknown_089E857C + 0x31a8
    .4byte gUnknown_089E857C + 0x31ac
    .4byte gUnknown_089E857C + 0x31b0
    .4byte gUnknown_089ED6AC + 0x63b
    .4byte gUnknown_089ED6AC + 0x838
    .4byte gUnknown_088B3AD8 + 0x1844c
    .4byte gUnknown_088B3AD8 + 0x1844c
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0xa728
    .4byte gUnknown_089F36A0 + 0xa79c
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xa878
    .4byte 0x00000602
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000005
    .4byte gUnknown_089ED6AC + 0x60
    .4byte 0x00140906
    .4byte 0x00000005
    .4byte gUnknown_089ED6AC + 0x6e
    .4byte 0x00140e0e
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte gUnknown_089F36A0 + 0xa844
    .4byte 0x00000006
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    
	.global TowerOfValni5Events
TowerOfValni5Events: @0x89eb7dc
    .4byte gUnknown_089E857C + 0x3204
    .4byte gUnknown_089E857C + 0x3214
    .4byte gUnknown_089E857C + 0x3218
    .4byte gUnknown_089E857C + 0x3234
    .4byte gUnknown_089E857C + 0x3250
    .4byte gUnknown_089E857C + 0x3254
    .4byte gUnknown_089E857C + 0x3258
    .4byte gUnknown_089E857C + 0x325c
    .4byte gUnknown_089ED6AC + 0x63c
    .4byte gUnknown_089ED6AC + 0x839
    .4byte gUnknown_088B3AD8 + 0x186b8
    .4byte gUnknown_088B3AD8 + 0x186b8
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0xa7d0
    .4byte gUnknown_089F36A0 + 0xa844
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000005
    .4byte gUnknown_089ED6AC + 0x7c
    .4byte 0x00141202
    .4byte 0x00000005
    .4byte gUnknown_089ED6AC + 0x86
    .4byte 0x0014010c
    .4byte 0x00000005
    .4byte gUnknown_089ED6AC + 0x9a
    .4byte 0x0014010a
    .4byte 0x00000007
    .4byte 0x13880077
    .4byte 0x00140113
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte gUnknown_089F36A0 + 0xa904
    .4byte 0x00000006
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    
	.global TowerOfValni6Events
TowerOfValni6Events: @0x89eb894
    .4byte gUnknown_089E857C + 0x32b0
    .4byte gUnknown_089E857C + 0x32b4
    .4byte gUnknown_089E857C + 0x32b8
    .4byte gUnknown_089E857C + 0x32ec
    .4byte gUnknown_089E857C + 0x3308
    .4byte gUnknown_089E857C + 0x330c
    .4byte gUnknown_089E857C + 0x3310
    .4byte gUnknown_089E857C + 0x3314
    .4byte gUnknown_089ED6AC + 0x63d
    .4byte gUnknown_089ED6AC + 0x83a
    .4byte gUnknown_088B3AD8 + 0x18af0
    .4byte gUnknown_088B3AD8 + 0x18af0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0xa890
    .4byte gUnknown_089F36A0 + 0xa904
    .4byte 0x000c0002
    .4byte gUnknown_089F36A0 + 0xaad0
    .4byte 0x0000ff01
    .4byte 0x000d0002
    .4byte gUnknown_089F36A0 + 0xaae8
    .4byte 0x0000ff01
    .4byte 0x000e0002
    .4byte gUnknown_089F36A0 + 0xab00
    .4byte 0x0000ff01
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte gUnknown_089F36A0 + 0xa9c8
    .4byte 0x00000006
    .4byte 0x00070001
    .4byte gUnknown_089F36A0 + 0xa9fc
    .4byte 0x00000000
    .4byte 0x00080001
    .4byte gUnknown_089F36A0 + 0xaa24
    .4byte 0x00000000
    .4byte 0x00090001
    .4byte gUnknown_089F36A0 + 0xaa4c
    .4byte 0x00000000
    .4byte 0x000a0001
    .4byte gUnknown_089F36A0 + 0xaa78
    .4byte 0x00000000
    .4byte 0x000b0001
    .4byte gUnknown_089F36A0 + 0xaaa4
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    
	.global TowerOfValni7Events
TowerOfValni7Events: @0x89eb97c
    .4byte gUnknown_089E857C + 0x3368
    .4byte gUnknown_089E857C + 0x3390
    .4byte gUnknown_089E857C + 0x3394
    .4byte gUnknown_089E857C + 0x3398
    .4byte gUnknown_089E857C + 0x33f0
    .4byte gUnknown_089E857C + 0x33f4
    .4byte gUnknown_089E857C + 0x33f8
    .4byte gUnknown_089E857C + 0x33fc
    .4byte gUnknown_089ED6AC + 0x63e
    .4byte gUnknown_089ED6AC + 0x83b
    .4byte gUnknown_088B3AD8 + 0x18ee0
    .4byte gUnknown_088B3AD8 + 0x18ee0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0xa948
    .4byte gUnknown_089F36A0 + 0xa9c8
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000007
    .4byte 0x00000075
    .4byte 0x0014080b
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte gUnknown_089F36A0 + 0xab8c
    .4byte 0x00000006
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    
	.global TowerOfValni8Events
TowerOfValni8Events: @0x89eba10
    .4byte gUnknown_089E857C + 0x3450
    .4byte gUnknown_089E857C + 0x3454
    .4byte gUnknown_089E857C + 0x3458
    .4byte gUnknown_089E857C + 0x3468
    .4byte gUnknown_089E857C + 0x3484
    .4byte gUnknown_089E857C + 0x3488
    .4byte gUnknown_089E857C + 0x348c
    .4byte gUnknown_089E857C + 0x3490
    .4byte gUnknown_089ED6AC + 0x63f
    .4byte gUnknown_089ED6AC + 0x83c
    .4byte gUnknown_088B3AD8 + 0x192dc
    .4byte gUnknown_088B3AD8 + 0x192dc
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0xab18
    .4byte gUnknown_089F36A0 + 0xab8c
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xac48
    .4byte 0x00000706
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xac60
    .4byte 0x00000008
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xac48
    .4byte 0x00000009
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xac60
    .4byte 0x0000000a
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte gUnknown_089F36A0 + 0xac2c
    .4byte 0x00000006
    .4byte 0x0007000b
    .4byte gUnknown_089F36A0 + 0xac78
    .4byte 0x110e0302
    .4byte 0x0007000b
    .4byte gUnknown_089F36A0 + 0xac78
    .4byte 0x11010500
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    
	.global LagdouRuins1Event
LagdouRuins1Event: @0x89ebae0
    .4byte gUnknown_089E857C + 0x34e4
    .4byte gUnknown_089E857C + 0x3518
    .4byte gUnknown_089E857C + 0x351c
    .4byte gUnknown_089E857C + 0x3520
    .4byte gUnknown_089E857C + 0x3554
    .4byte gUnknown_089E857C + 0x3558
    .4byte gUnknown_089E857C + 0x355c
    .4byte gUnknown_089E857C + 0x3560
    .4byte gUnknown_089ED6AC + 0x64c
    .4byte gUnknown_089ED6AC + 0x83d
    .4byte gUnknown_088B3AD8 + 0x195e8
    .4byte gUnknown_088B3AD8 + 0x195e8
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0xabb0
    .4byte gUnknown_089F36A0 + 0xac2c
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte gUnknown_089F36A0 + 0xad1c
    .4byte 0x00000006
    .4byte 0x0007000b
    .4byte gUnknown_089F36A0 + 0xad38
    .4byte 0x1116000a
    .4byte 0x0007000b
    .4byte gUnknown_089F36A0 + 0xad38
    .4byte 0x11090a00
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000

	.global LagdouRuins2Event
LagdouRuins2Event: @0x89ebb80
    .4byte gUnknown_089E857C + 0x35b4
    .4byte gUnknown_089E857C + 0x35b8
    .4byte gUnknown_089E857C + 0x35bc
    .4byte gUnknown_089E857C + 0x35c0
    .4byte gUnknown_089E857C + 0x35f4
    .4byte gUnknown_089E857C + 0x35f8
    .4byte gUnknown_089E857C + 0x35fc
    .4byte gUnknown_089E857C + 0x3600
    .4byte gUnknown_089ED6AC + 0x64d
    .4byte gUnknown_089ED6AC + 0x83e
    .4byte gUnknown_088B3AD8 + 0x19a5c
    .4byte gUnknown_088B3AD8 + 0x19a5c
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0xaca8
    .4byte gUnknown_089F36A0 + 0xad1c
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xae04
    .4byte 0x00000704
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xae1c
    .4byte 0x00000a06
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xae34
    .4byte 0x00000003
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xae4c
    .4byte 0x00000002
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xae64
    .4byte 0x00000002
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000005
    .4byte gUnknown_089ED6AC + 0xa8
    .4byte 0x00140201
    .4byte 0x00000005
    .4byte gUnknown_089ED6AC + 0xb6
    .4byte 0x00140f0f
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120609
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120811
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00121601
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120701
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120608
    .4byte 0x00000007
    .4byte 0x0bb80077
    .4byte 0x00140311
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte gUnknown_089F36A0 + 0xade8
    .4byte 0x00000006
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    
	.global LagdouRuins3Event
LagdouRuins3Event: @0x89ebca4
    .4byte gUnknown_089E857C + 0x3654
    .4byte gUnknown_089E857C + 0x3694
    .4byte gUnknown_089E857C + 0x3698
    .4byte gUnknown_089E857C + 0x36fc
    .4byte gUnknown_089E857C + 0x3718
    .4byte gUnknown_089E857C + 0x371c
    .4byte gUnknown_089E857C + 0x3720
    .4byte gUnknown_089E857C + 0x3724
    .4byte gUnknown_089ED6AC + 0x64e
    .4byte gUnknown_089ED6AC + 0x83f
    .4byte gUnknown_088B3AD8 + 0x19f20
    .4byte gUnknown_088B3AD8 + 0x19f20
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0xad74
    .4byte gUnknown_089F36A0 + 0xade8
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xaef0
    .4byte 0x00000004
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xaf08
    .4byte 0x00000908
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000005
    .4byte gUnknown_089ED6AC + 0xc6
    .4byte 0x00140212
    .4byte 0x00000005
    .4byte gUnknown_089ED6AC + 0xd0
    .4byte 0x00141a01
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte gUnknown_089F36A0 + 0xaf20
    .4byte 0x00000006
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    
	.global LagdouRuins4Event
LagdouRuins4Event: @0x89ebd5c
    .4byte gUnknown_089E857C + 0x3778
    .4byte gUnknown_089E857C + 0x3794
    .4byte gUnknown_089E857C + 0x3798
    .4byte gUnknown_089E857C + 0x37b4
    .4byte gUnknown_089E857C + 0x37d0
    .4byte gUnknown_089E857C + 0x37d4
    .4byte gUnknown_089E857C + 0x37d8
    .4byte gUnknown_089E857C + 0x37dc
    .4byte gUnknown_089ED6AC + 0x64f
    .4byte gUnknown_089ED6AC + 0x840
    .4byte gUnknown_088B3AD8 + 0x1a470
    .4byte gUnknown_088B3AD8 + 0x1a470
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0xae7c
    .4byte gUnknown_089F36A0 + 0xaf20
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xafdc
    .4byte 0x00000008
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xaff4
    .4byte 0x00000002
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xb00c
    .4byte 0x00000004
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000005
    .4byte gUnknown_089ED6AC + 0xe6
    .4byte 0x00140a0d
    .4byte 0x00000005
    .4byte gUnknown_089ED6AC + 0xf0
    .4byte 0x00141511
    .4byte 0x00000005
    .4byte gUnknown_089ED6AC + 0xfc
    .4byte 0x00140404
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte gUnknown_089F36A0 + 0xafb0
    .4byte 0x00000006
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    
	.global LagdouRuins5Event
LagdouRuins5Event: @0x89ebe2c
    .4byte gUnknown_089E857C + 0x3830
    .4byte gUnknown_089E857C + 0x3858
    .4byte gUnknown_089E857C + 0x385c
    .4byte gUnknown_089E857C + 0x3884
    .4byte gUnknown_089E857C + 0x38a0
    .4byte gUnknown_089E857C + 0x38a4
    .4byte gUnknown_089E857C + 0x38a8
    .4byte gUnknown_089E857C + 0x38ac
    .4byte gUnknown_089ED6AC + 0x650
    .4byte gUnknown_089ED6AC + 0x841
    .4byte gUnknown_088B3AD8 + 0x1a894
    .4byte gUnknown_088B3AD8 + 0x1a894
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0xaf3c
    .4byte gUnknown_089F36A0 + 0xafb0
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xb0b4
    .4byte 0x00000004
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xb0cc
    .4byte 0x00000005
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xb0b4
    .4byte 0x00000006
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xb0e4
    .4byte 0x00000007
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xb0b4
    .4byte 0x00000008
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xb0fc
    .4byte 0x00000009
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xb0b4
    .4byte 0x0000000a
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120710
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte gUnknown_089F36A0 + 0xb098
    .4byte 0x00000006
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    
	.global LagdouRuins6Event
LagdouRuins6Event: @0x89ebf14
    .4byte gUnknown_089E857C + 0x3900
    .4byte gUnknown_089E857C + 0x3958
    .4byte gUnknown_089E857C + 0x395c
    .4byte gUnknown_089E857C + 0x396c
    .4byte gUnknown_089E857C + 0x3988
    .4byte gUnknown_089E857C + 0x398c
    .4byte gUnknown_089E857C + 0x3990
    .4byte gUnknown_089E857C + 0x3994
    .4byte gUnknown_089ED6AC + 0x6cf
    .4byte gUnknown_089ED6AC + 0x842
    .4byte gUnknown_088B3AD8 + 0x1ac68
    .4byte gUnknown_088B3AD8 + 0x1ac68
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0xb024
    .4byte gUnknown_089F36A0 + 0xb098
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xb1c0
    .4byte 0x00000403
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xb1d8
    .4byte 0x00000504
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xb1f0
    .4byte 0x00000605
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xb208
    .4byte 0x00000604
    .4byte 0x00080002
    .4byte gUnknown_089F36A0 + 0xb240
    .4byte 0x0000ff01
    .4byte 0x000a0002
    .4byte gUnknown_089F36A0 + 0xb294
    .4byte 0x0000ff01
    .4byte 0x000c0002
    .4byte gUnknown_089F36A0 + 0xb2e8
    .4byte 0x0000ff01
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xb31c
    .4byte 0x00000a09
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000005
    .4byte gUnknown_089ED6AC + 0x10a
    .4byte 0x00140b05
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte gUnknown_089F36A0 + 0xb194
    .4byte 0x00000006
    .4byte 0x0007000b
    .4byte gUnknown_089F36A0 + 0xb220
    .4byte 0x0c060a02
    .4byte 0x0009000b
    .4byte gUnknown_089F36A0 + 0xb274
    .4byte 0x1518110e
    .4byte 0x0009000b
    .4byte gUnknown_089F36A0 + 0xb274
    .4byte 0x19181615
    .4byte 0x000b000b
    .4byte gUnknown_089F36A0 + 0xb2c8
    .4byte 0x1914160d
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    
	.global LagdouRuins7Event
LagdouRuins7Event: @0x89ec038
    .4byte gUnknown_089E857C + 0x39e8
    .4byte gUnknown_089E857C + 0x3a4c
    .4byte gUnknown_089E857C + 0x3a50
    .4byte gUnknown_089E857C + 0x3a60
    .4byte gUnknown_089E857C + 0x3aac
    .4byte gUnknown_089E857C + 0x3ab0
    .4byte gUnknown_089E857C + 0x3ab4
    .4byte gUnknown_089E857C + 0x3ab8
    .4byte gUnknown_089ED6AC + 0x6d0
    .4byte gUnknown_089ED6AC + 0x843
    .4byte gUnknown_088B3AD8 + 0x1b1ac
    .4byte gUnknown_088B3AD8 + 0x1b1ac
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0xb114
    .4byte gUnknown_089F36A0 + 0xb194
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xb530
    .4byte 0x0000ff01
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xb5a0
    .4byte 0x0000ff01
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xb5fc
    .4byte 0x0000ff01
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xb690
    .4byte 0x0000ff01
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xb710
    .4byte 0x0000ff01
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xb780
    .4byte 0x0000ff01
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xb7dc
    .4byte 0x0000ff01
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xb874
    .4byte 0x0000ff01
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xb8f8
    .4byte 0x0000ff01
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xb9a4
    .4byte 0x0000ff01
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xba3c
    .4byte 0x0000ff01
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xbab0
    .4byte 0x0000ff01
    .4byte 0x00080002
    .4byte gUnknown_089F36A0 + 0xb3f4
    .4byte 0x0000ff01
    .4byte 0x000a0002
    .4byte gUnknown_089F36A0 + 0xb448
    .4byte 0x0000ff01
    .4byte 0x000c0002
    .4byte gUnknown_089F36A0 + 0xb49c
    .4byte 0x0000ff01
    .4byte 0x000e0002
    .4byte gUnknown_089F36A0 + 0xb4fc
    .4byte 0x0000ff01
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120510
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00120511
    .4byte 0x00000005
    .4byte gUnknown_089ED6AC + 0x112
    .4byte 0x00140c04
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte gUnknown_089F36A0 + 0xb3b8
    .4byte 0x00000006
    .4byte 0x000b000b
    .4byte gUnknown_089F36A0 + 0xb47c
    .4byte 0x0d12080f
    .4byte 0x000d000b
    .4byte gUnknown_089F36A0 + 0xb4d0
    .4byte 0x0713000d
    .4byte 0x000d000b
    .4byte gUnknown_089F36A0 + 0xb4d0
    .4byte 0x060c0007
    .4byte 0x0007000b
    .4byte gUnknown_089F36A0 + 0xb3d4
    .4byte 0x0e0b0b08
    .4byte 0x0009000b
    .4byte gUnknown_089F36A0 + 0xb428
    .4byte 0x14130f0d
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    
	.global LagdouRuins8Event
LagdouRuins8Event: @0x89ec1e0
    .4byte gUnknown_089E857C + 0x3b0c
    .4byte gUnknown_089E857C + 0x3bd0
    .4byte gUnknown_089E857C + 0x3bd4
    .4byte gUnknown_089E857C + 0x3bfc
    .4byte gUnknown_089E857C + 0x3c54
    .4byte gUnknown_089E857C + 0x3c58
    .4byte gUnknown_089E857C + 0x3c5c
    .4byte gUnknown_089E857C + 0x3c60
    .4byte gUnknown_089ED6AC + 0x6d1
    .4byte gUnknown_089ED6AC + 0x844
    .4byte gUnknown_088B3AD8 + 0x1b634
    .4byte gUnknown_088B3AD8 + 0x1b634
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0xb334
    .4byte gUnknown_089F36A0 + 0xb3b8
    .4byte 0x00080002
    .4byte gUnknown_089F36A0 + 0xbbe8
    .4byte 0x0000ff01
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte gUnknown_089F36A0 + 0xbb88
    .4byte 0x00000006
    .4byte 0x0009000b
    .4byte gUnknown_089F36A0 + 0xbba4
    .4byte 0x0b110008
    .4byte 0x0007000b
    .4byte gUnknown_089F36A0 + 0xbbc8
    .4byte 0x05070000
    .4byte 0x0009000b
    .4byte gUnknown_089F36A0 + 0xbba4
    .4byte 0x0b070600
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    
	.global LagdouRuins9Event
LagdouRuins9Event: @0x89ec298
    .4byte gUnknown_089E857C + 0x3cb4
    .4byte gUnknown_089E857C + 0x3cc4
    .4byte gUnknown_089E857C + 0x3cc8
    .4byte gUnknown_089E857C + 0x3ccc
    .4byte gUnknown_089E857C + 0x3d0c
    .4byte gUnknown_089E857C + 0x3d10
    .4byte gUnknown_089E857C + 0x3d14
    .4byte gUnknown_089E857C + 0x3d18
    .4byte gUnknown_089ED6AC + 0x6d2
    .4byte gUnknown_089ED6AC + 0x845
    .4byte gUnknown_088B3AD8 + 0x1baf8
    .4byte gUnknown_088B3AD8 + 0x1baf8
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0xbb10
    .4byte gUnknown_089F36A0 + 0xbb88
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000005
    .4byte gUnknown_089ED6AC + 0x11a
    .4byte 0x00140209
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte gUnknown_089F36A0 + 0xbc90
    .4byte 0x00000006
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    
	.global LagdouRuins10Event
LagdouRuins10Event: @0x89ec32c
    .4byte gUnknown_089E857C + 0x3d6c
    .4byte gUnknown_089E857C + 0x3d70
    .4byte gUnknown_089E857C + 0x3d74
    .4byte gUnknown_089E857C + 0x3d84
    .4byte gUnknown_089E857C + 0x3da0
    .4byte gUnknown_089E857C + 0x3da4
    .4byte gUnknown_089E857C + 0x3da8
    .4byte gUnknown_089E857C + 0x3dac
    .4byte gUnknown_089ED6AC + 0x7c9
    .4byte gUnknown_089ED6AC + 0x8be
    .4byte gUnknown_088B3AD8 + 0x1bf58
    .4byte gUnknown_088B3AD8 + 0x1bf58
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0xbc1c
    .4byte gUnknown_089F36A0 + 0xbc90
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00030005
    .4byte 0x00000001
    .4byte 0x00110407
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    
	.global LordsSplitEvents
LordsSplitEvents: @0x89ec3b4
    .4byte gUnknown_089E857C + 0x3e00
    .4byte gUnknown_089E857C + 0x3e04
    .4byte gUnknown_089E857C + 0x3e08
    .4byte gUnknown_089E857C + 0x3e18
    .4byte gUnknown_089E857C + 0x3e28
    .4byte gUnknown_089E857C + 0x3e2c
    .4byte gUnknown_089E857C + 0x3e30
    .4byte gUnknown_089E857C + 0x3e34
    .4byte gUnknown_089ED6AC + 0x7ca
    .4byte gUnknown_089ED6AC + 0x8bf
    .4byte gUnknown_088B3AD8 + 0x1c0fc
    .4byte gUnknown_088B3AD8 + 0x1c0fc
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0xbcb4
    .4byte gUnknown_089F36A0 + 0xbd90
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte gUnknown_089F36A0 + 0xbdb0
    .4byte 0x00000006
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    
	.global MelkaenCoastEvent
MelkaenCoastEvent: @0x89ec43c
    .4byte gUnknown_089E857C + 0x3e88
    .4byte gUnknown_089E857C + 0x3e8c
    .4byte gUnknown_089E857C + 0x3e90
    .4byte gUnknown_089E857C + 0x3e94
    .4byte gUnknown_089E857C + 0x3eb0
    .4byte gUnknown_089E857C + 0x3eb4
    .4byte gUnknown_089E857C + 0x3eb8
    .4byte gUnknown_089E857C + 0x3ebc
    .4byte gUnknown_089ED6AC + 0x7cb
    .4byte gUnknown_089ED6AC + 0x8c0
    .4byte gUnknown_088B3AD8 + 0x1c124
    .4byte gUnknown_088B3AD8 + 0x1c124
    .4byte gUnknown_088B3AD8 + 0x1c5fc
    .4byte gUnknown_088B3AD8 + 0x1cad4
    .4byte gUnknown_088B3AD8 + 0x1cfac
    .4byte gUnknown_088B3AD8 + 0x1c6c4
    .4byte gUnknown_088B3AD8 + 0x1cb9c
    .4byte gUnknown_088B3AD8 + 0x1d074
    .4byte gUnknown_089F36A0 + 0xbd94
    .4byte gUnknown_089F36A0 + 0xbdb0
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xbdd4
    .4byte 0x00000000
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xbdd4
    .4byte 0x00000001
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xbdd4
    .4byte 0x00000002
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xbdd4
    .4byte 0x00000003
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xbdd4
    .4byte 0x00000004
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xbdd4
    .4byte 0x00000005
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xbdd4
    .4byte 0x00000006
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xbdd4
    .4byte 0x00000007
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xbdd4
    .4byte 0x00000008
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xbdd4
    .4byte 0x00000009
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xbdd4
    .4byte 0x0000000a
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xbdd4
    .4byte 0x0000000b
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xbdd4
    .4byte 0x0000000c
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xbdd4
    .4byte 0x0000000d
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xbdd4
    .4byte 0x0000000e
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xbdd4
    .4byte 0x0000000f
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xbdd4
    .4byte 0x00000010
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xbdd4
    .4byte 0x00000011
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xbdd4
    .4byte 0x00000012
    .4byte 0x00000002
    .4byte gUnknown_089F36A0 + 0xbdd4
    .4byte 0x00000013
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    
	.global AnInterestingMapEvents
AnInterestingMapEvents: @0x89ec5a8
    .4byte gUnknown_089E857C + 0x3f10
    .4byte gUnknown_089E857C + 0x4004
    .4byte gUnknown_089E857C + 0x4008
    .4byte gUnknown_089E857C + 0x400c
    .4byte gUnknown_089E857C + 0x401c
    .4byte gUnknown_089E857C + 0x4020
    .4byte gUnknown_089E857C + 0x4024
    .4byte gUnknown_089E857C + 0x4028
    .4byte gUnknown_089ED6AC + 0x7cc
    .4byte gUnknown_089ED6AC + 0x8c1
    .4byte gUnknown_088B3AD8 + 0x1d484
    .4byte gUnknown_088B3AD8 + 0x1d484
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089F36A0 + 0xbdb8
    .4byte gUnknown_089F36A0 + 0xbdd8
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000005
    .4byte gUnknown_089FF480 + 0x74
    .4byte 0x00100101
    .4byte 0x00000005
    .4byte gUnknown_089FF480 + 0x6c8
    .4byte 0x00100103
    .4byte 0x00000005
    .4byte gUnknown_089FF480 + 0x738
    .4byte 0x00100105
    .4byte 0x00000000
    .4byte 0x0000000b
    .4byte gUnknown_089FF480 + 0x64
    .4byte 0x01010101
    .4byte 0x0000000b
    .4byte gUnknown_089FF480 + 0x6b8
    .4byte 0x01030103
    .4byte 0x0000000b
    .4byte gUnknown_089FF480 + 0x728
    .4byte 0x01050105
    .4byte 0x00000001
    .4byte gEvent_GameOver
    .4byte 0x00000065
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    
	.global DebugMapEvents
DebugMapEvents: @0x89ec66c
    .4byte gUnknown_089E857C + 0x407c
    .4byte gUnknown_089E857C + 0x4080
    .4byte gUnknown_089E857C + 0x4084
    .4byte gUnknown_089E857C + 0x40ac
    .4byte gUnknown_089E857C + 0x40e0
    .4byte gUnknown_089E857C + 0x40e4
    .4byte gUnknown_089E857C + 0x40e8
    .4byte gUnknown_089E857C + 0x40ec
    .4byte gUnknown_089ED6AC + 0x7cd
    .4byte gUnknown_089ED6AC + 0x8c2
    .4byte gUnknown_088B3AD8 + 0x1d6b4
    .4byte gUnknown_088B3AD8 + 0x1d6b4
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_089FF480 + 0x38
    .4byte gUnknown_089FF480 + 0x58

	.global gUnknown_089EC6BC
gUnknown_089EC6BC:  @ 0x089EC6BC
	.incbin "baserom.gba", 0x9EC6BC, 0x690

	.global gUnknown_089ECD4C
gUnknown_089ECD4C:  @ 0x089ECD4C
	.incbin "baserom.gba", 0x9ECD4C, 0x3C0
