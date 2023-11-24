	.section .data

	.global gUnknown_085B9D6C
gUnknown_085B9D6C:  @ 0x085B9D6C
    .4byte gUnknown_085B9E4C + 0xc
    .4byte gUnknown_085B9E4C + 0xa4
    .4byte gUnknown_085B9E4C + 0x13c
    .4byte gUnknown_085B9E4C + 0x1d4
    .4byte gUnknown_085B9E4C + 0x13c
    .4byte gUnknown_085B9E4C + 0x1d4
    .4byte gUnknown_085B9E4C + 0x13c
    .4byte gUnknown_085B9E4C + 0x1d4
    .4byte gUnknown_085B9E4C + 0xc
    .4byte gUnknown_085B9E4C + 0xa4

	.global gProc_ekrChienCHR
gProc_ekrChienCHR:  @ 0x085B9D94
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80daf34
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EkrChienCHRMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gProc_efxAnimeDrvProc
gProc_efxAnimeDrvProc:  @ 0x085B9DAC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80daf40
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ExecAllAIS
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_ekrUnitMainMini
ProcScr_ekrUnitMainMini:  @ 0x085B9DC4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80daf50
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EkrUnitMainMiniMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gProc_ekrTogiInit
gProc_ekrTogiInit:  @ 0x085B9DDC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80daff8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805B104
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805B18C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805B200
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805B264
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gProc_ekrTogiEnd
gProc_ekrTogiEnd:  @ 0x085B9E0C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80db008
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805B290
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805B2BC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805B320
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gProc_ekrTogiColor
gProc_ekrTogiColor:  @ 0x085B9E34
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80db018
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805B394
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B9E4C
gUnknown_085B9E4C:  @ 0x085B9E4C
	.incbin "baserom.gba", 0x5B9E4C, 0x26C

	.global Img_NODAMGEMIS
Img_NODAMGEMIS:  @ 0x085BA0B8
	.incbin "baserom.gba", 0x5BA0B8, 0x228

	.global Pal_085BA2E0
Pal_085BA2E0:  @ 0x085BA2E0
	.incbin "baserom.gba", 0x5BA2E0, 0x20

	.global Pal_085BA300
Pal_085BA300:  @ 0x085BA300
	.incbin "baserom.gba", 0x5BA300, 0x20

	.global Pal_085BA320
Pal_085BA320:  @ 0x085BA320
	.incbin "baserom.gba", 0x5BA320, 0x20

	.global gUnknown_085BA340
gUnknown_085BA340:  @ 0x085BA340
	.incbin "baserom.gba", 0x5BA340, 0x5BB0C8 - 0x5BA340
