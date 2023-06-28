	.section .data

	.global gProc_ekrbattleendin
gProc_ekrbattleendin:  @ 0x085B9B1C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dad68
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrBattleEnding_80560F0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrBattleEnding_8056170
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrBattleEnding_80561C8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrBattleEnding_8056228
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrBattleEnding_8056288
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrBattleEnding_8056310
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrBattleEnding_8056390
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrBattleEnding_8056484
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gProc_EkrBaseKaiten
gProc_EkrBaseKaiten:  @ 0x085B9B6C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dad78
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8056864
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B9B84
gUnknown_085B9B84:  @ 0x085B9B84
    .4byte gUnknown_080DB026 + 0x512
    .4byte 0
    .4byte gUnknown_080DB026 + 0x512
    .4byte 0
    .4byte gUnknown_080DB026 + 0xe
    .4byte 0
    .4byte gUnknown_080DB026 + 0x512
    .4byte 0

	.global gUnknown_085B9BA4
gUnknown_085B9BA4:  @ 0x085B9BA4
    .4byte gUnknown_080DB026 + 0x99e
    .4byte gUnknown_080DB026 + 0xdf6
    .4byte gUnknown_080DB026 + 0xdf6
    .4byte gUnknown_080DB026 + 0xdf6
    .4byte gUnknown_080DB026 + 0x132a
    .4byte gUnknown_080DB026 + 0xdf6
    .4byte gUnknown_080DB026 + 0xdf6
    .4byte gUnknown_080DB026 + 0xdf6

	.global gUnknown_085B9BC4
gUnknown_085B9BC4:  @ 0x085B9BC4
    .4byte gUnknown_085D1470 + 0x1a48
    .4byte 0
    .4byte gUnknown_085D1470 + 0x1a68
    .4byte 0
    .4byte gUnknown_085D1470 + 0xdb8
    .4byte 0
    .4byte gUnknown_085D1470 + 0x1a8c
    .4byte 0

	.global gUnknown_085B9BE4
gUnknown_085B9BE4:  @ 0x085B9BE4
    .4byte gUnknown_085D1470 + 0x231c
    .4byte gUnknown_085D1470 + 0x3180
    .4byte gUnknown_085D1470 + 0x3180
    .4byte gUnknown_085D1470 + 0x3180
    .4byte gUnknown_085D1470 + 0x3984
    .4byte gUnknown_085D1470 + 0x31a4
    .4byte gUnknown_085D1470 + 0x31a4
    .4byte gUnknown_085D1470 + 0x31a4

	.global gUnknown_085B9C04
gUnknown_085B9C04:  @ 0x085B9C04
    .4byte gUnknown_085D1470 + 0x22f8
    .4byte gUnknown_085D1470 + 0x3138
    .4byte gUnknown_085D1470 + 0x3138
    .4byte gUnknown_085D1470 + 0x3138
    .4byte gUnknown_085D1470 + 0x3960
    .4byte gUnknown_085D1470 + 0x315c
    .4byte gUnknown_085D1470 + 0x315c
    .4byte gUnknown_085D1470 + 0x315c

	.global gUnknown_085B9C24
gUnknown_085B9C24:  @ 0x085B9C24
    .4byte gUnknown_085D1470 + 0x1ab0
    .4byte 0
    .4byte gUnknown_085D1470 + 0x1ad0
    .4byte 0
    .4byte gUnknown_085D1470 + 0xddc
    .4byte 0
    .4byte gUnknown_085D1470 + 0x1af4
    .4byte 0

	.global gUnknown_085B9C44
gUnknown_085B9C44:  @ 0x085B9C44
    .4byte gUnknown_085D1470 + 0x2364
    .4byte gUnknown_085D1470 + 0x3210
    .4byte gUnknown_085D1470 + 0x3210
    .4byte gUnknown_085D1470 + 0x3210
    .4byte gUnknown_085D1470 + 0x39cc
    .4byte gUnknown_085D1470 + 0x3234
    .4byte gUnknown_085D1470 + 0x3234
    .4byte gUnknown_085D1470 + 0x3234

	.global gUnknown_085B9C64
gUnknown_085B9C64:  @ 0x085B9C64
    .4byte gUnknown_085D1470 + 0x2340
    .4byte gUnknown_085D1470 + 0x31c8
    .4byte gUnknown_085D1470 + 0x31c8
    .4byte gUnknown_085D1470 + 0x31c8
    .4byte gUnknown_085D1470 + 0x39a8
    .4byte gUnknown_085D1470 + 0x31ec
    .4byte gUnknown_085D1470 + 0x31ec
    .4byte gUnknown_085D1470 + 0x31ec

	.global gUnknown_085B9C84
gUnknown_085B9C84:  @ 0x085B9C84
    .4byte gUnknown_080DAD0A + 0x8c
    .4byte 0
    .4byte gUnknown_080DAD0A + 0x9c
    .4byte 0
    .4byte gUnknown_080DAD0A + 0x7c
    .4byte 0
    .4byte gUnknown_080DAD0A + 0xac
    .4byte 0

	.global gUnknown_085B9CA4
gUnknown_085B9CA4:  @ 0x085B9CA4
    .4byte gUnknown_080DAD0A + 0xcc
    .4byte gUnknown_080DAD0A + 0xfc
    .4byte gUnknown_080DAD0A + 0xfc
    .4byte gUnknown_080DAD0A + 0xfc
    .4byte gUnknown_080DAD0A + 0x12c
    .4byte gUnknown_080DAD0A + 0x10c
    .4byte gUnknown_080DAD0A + 0x10c
    .4byte gUnknown_080DAD0A + 0x10c

	.global gUnknown_085B9CC4
gUnknown_085B9CC4:  @ 0x085B9CC4
    .4byte gUnknown_080DAD0A + 0xbc
    .4byte gUnknown_080DAD0A + 0xdc
    .4byte gUnknown_080DAD0A + 0xdc
    .4byte gUnknown_080DAD0A + 0xdc
    .4byte gUnknown_080DAD0A + 0x11c
    .4byte gUnknown_080DAD0A + 0xec
    .4byte gUnknown_080DAD0A + 0xec
    .4byte gUnknown_080DAD0A + 0xec

	.global ProcScr_ekrUnitKakudai
ProcScr_ekrUnitKakudai:  @ 0x085B9CE4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dae48
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word UnitKakudai1
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word UnitKakudai2
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8056D18
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gProc_ekrWindowAppear
gProc_ekrWindowAppear:  @ 0x085B9D0C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dae58
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8056D90
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gProc_ekrNamewinAppear
gProc_ekrNamewinAppear:  @ 0x085B9D24
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dae68
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8056E7C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8056EA4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_ekrBaseAppear
ProcScr_ekrBaseAppear:  @ 0x085B9D44
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dae7c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EndEkrBaseAppear
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
