	.section .data

	.global gUnknown_085B9D5C
gUnknown_085B9D5C:  @ 0x085B9D5C
	.incbin "baserom.gba", 0x5B9D5C, 0x10

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

	.global gUnknown_085BA0B8
gUnknown_085BA0B8:  @ 0x085BA0B8
	.incbin "baserom.gba", 0x5BA0B8, 0x228

	.global gUnknown_085BA2E0
gUnknown_085BA2E0:  @ 0x085BA2E0
	.incbin "baserom.gba", 0x5BA2E0, 0x20

	.global gUnknown_085BA300
gUnknown_085BA300:  @ 0x085BA300
	.incbin "baserom.gba", 0x5BA300, 0x20

	.global gUnknown_085BA320
gUnknown_085BA320:  @ 0x085BA320
	.incbin "baserom.gba", 0x5BA320, 0xDA8

	.global gUnknown_085BB0C8
gUnknown_085BB0C8:  @ 0x085BB0C8
	.incbin "baserom.gba", 0x5BB0C8, 0x214

	.global gUnknown_085BB2DC
gUnknown_085BB2DC:  @ 0x085BB2DC
	.incbin "baserom.gba", 0x5BB2DC, 0xEAC

	.global gUnknown_085BC188
gUnknown_085BC188:  @ 0x085BC188
	.incbin "baserom.gba", 0x5BC188, 0x266C

	.global gUnknown_085BE7F4
gUnknown_085BE7F4:  @ 0x085BE7F4
	.incbin "baserom.gba", 0x5BE7F4, 0x7A0

	.global gUnknown_085BEF94
gUnknown_085BEF94:  @ 0x085BEF94
	.incbin "baserom.gba", 0x5BEF94, 0x5918

	.global gUnknown_085C48AC
gUnknown_085C48AC:  @ 0x085C48AC
	.incbin "baserom.gba", 0x5C48AC, 0x10E8

	.global gUnknown_085C5994
gUnknown_085C5994:  @ 0x085C5994
	.incbin "baserom.gba", 0x5C5994, 0x6C0

	.global gUnknown_085C6054
gUnknown_085C6054:  @ 0x085C6054
	.incbin "baserom.gba", 0x5C6054, 0x80

	.global gUnknown_085C60D4
gUnknown_085C60D4:  @ 0x085C60D4
	.incbin "baserom.gba", 0x5C60D4, 0x65C

	.global gUnknown_085C6730
gUnknown_085C6730:  @ 0x085C6730
	.incbin "baserom.gba", 0x5C6730, 0xAB4

@ Following are some animation scripts. these contain pointers, sometimes
@ packed with other data into one word. Ideally there'd be some macros here
@ based on the decoding in animedrv.c - but I think the alignment guarantees
@ that shifting the objects referenced here doesn't affect the other data.

	.global gUnknown_085C71E4
gUnknown_085C71E4:  @ 0x085C71E4
@ Replacing .incbin "baserom.gba", 0x5C71E4, 0xC8
    .4byte gUnknown_085C6730 + 0x299
    .4byte gUnknown_085C6730 + 0x2d5
    .4byte gUnknown_085C6730 + 0x329
    .4byte gUnknown_085C6730 + 0x395
    .4byte gUnknown_085C6730 + 0x419
    .4byte gUnknown_085C6730 + 0x49d
    .4byte gUnknown_085C6730 + 0x52d
    .4byte gUnknown_085C6730 + 0x5bd
    .4byte gUnknown_085C6730 + 0x641
    .4byte gUnknown_085C6730 + 0x6c5
    .4byte gUnknown_085C6730 + 0x755
    .4byte gUnknown_085C6730 + 0x7e5
    .4byte gUnknown_085C6730 + 0x881
    .4byte gUnknown_085C6730 + 0x91d
    .4byte gUnknown_085C6730 + 0x9b9
    .4byte 0x20000000 + gUnknown_085C6730 + 0xa4a
    .4byte 0x80000000
    .4byte 0x80004000
    .4byte 0xffd00000
    .4byte 0x00000008
    .4byte 0x80004000
    .4byte 0xfff00004
    .4byte 0x00000008
    .4byte 0x80004000
    .4byte 0x00100008
    .4byte 0x00000008
    .4byte 0x00008000
    .4byte 0x0030000c
    .4byte 0x00000008
    .4byte 0x80004000
    .4byte 0xffd0000d
    .4byte 0x0000fff8
    .4byte 0x80004000
    .4byte 0xfff00011
    .4byte 0x0000fff8
    .4byte 0x80004000
    .4byte 0x00100015
    .4byte 0x0000fff8
    .4byte 0x40004000
    .4byte 0xffd00019
    .4byte 0x0000fff0
    .4byte 0x00004000
    .4byte 0xfff0001d
    .4byte 0x0000fff0
    .4byte 0x40004000
    .4byte 0x00000039
    .4byte 0x0000fff0
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000

	.global gUnknown_085C72AC
gUnknown_085C72AC:  @ 0x085C72AC
    .4byte 0x10000000 + gUnknown_085C71E4 + 0x44
    .4byte 0x80000000

	.global gUnknown_085C72B4
gUnknown_085C72B4:  @ 0x085C72B4
	.incbin "baserom.gba", 0x5C72B4, 0x84

	.global gUnknown_085C7338
gUnknown_085C7338:  @ 0x085C7338
    .4byte 0x10000000 + gUnknown_085C72B4
    .4byte 0x80000000

	.global gUnknown_085C7340
gUnknown_085C7340:  @ 0x085C7340
    .incbin "baserom.gba", 0x5C7340, 0x78

	.global gUnknown_085C73B8
gUnknown_085C73B8:  @ 0x085C73B8
    .4byte 0x10000000 + gUnknown_085C7340
    .4byte 0x80000000

	.global gUnknown_085C73C0
gUnknown_085C73C0:  @ 0x085C73C0
	.incbin "baserom.gba", 0x5C73C0, 0x78

	.global gUnknown_085C7438
gUnknown_085C7438:  @ 0x085C7438
    .4byte 0x10000000 + gUnknown_085C73C0
    .4byte 0x80000000

	.global gUnknown_085C7440
gUnknown_085C7440:  @ 0x085C7440
	.incbin "baserom.gba", 0x5C7440, 0xD64

	.global gUnknown_085C81A4
gUnknown_085C81A4:  @ 0x085C81A4
@ Replacing .incbin "baserom.gba", 0x5C81A4, 0x74
    .4byte gUnknown_085C7438 + 0x7d
    .4byte gUnknown_085C7438 + 0xa1
    .4byte gUnknown_085C7438 + 0xc5
    .4byte gUnknown_085C7438 + 0xe9
    .4byte gUnknown_085C7438 + 0x125
    .4byte gUnknown_085C7438 + 0x161
    .4byte gUnknown_085C7438 + 0x19d
    .4byte gUnknown_085C7438 + 0x1e5
    .4byte gUnknown_085C7438 + 0x22d
    .4byte gUnknown_085C7438 + 0x275
    .4byte gUnknown_085C7438 + 0x2c9
    .4byte gUnknown_085C7438 + 0x31d
    .4byte gUnknown_085C7438 + 0x371
    .4byte gUnknown_085C7438 + 0x3d1
    .4byte gUnknown_085C7438 + 0x431
    .4byte gUnknown_085C7438 + 0x491
    .4byte gUnknown_085C7438 + 0x4fd
    .4byte gUnknown_085C7438 + 0x569
    .4byte gUnknown_085C7438 + 0x5d5
    .4byte gUnknown_085C7438 + 0x64d
    .4byte gUnknown_085C7438 + 0x6c5
    .4byte gUnknown_085C7438 + 0x73d
    .4byte gUnknown_085C7438 + 0x7b5
    .4byte gUnknown_085C7438 + 0x82d
    .4byte 0x70000000 + gUnknown_085C7438 + 0x8a7
    .4byte 0x84000013
    .4byte 0x70000000 + gUnknown_085C7438 + 0x91f
    .4byte 0x84000013
    .4byte 0x80000000

	.global gUnknown_085C8218
gUnknown_085C8218:  @ 0x085C8218
@ Replacing .incbin "baserom.gba", 0x5C8218, 0x60
    .4byte gUnknown_085C7438 + 0x935
    .4byte gUnknown_085C7438 + 0x94d
    .4byte gUnknown_085C7438 + 0x965
    .4byte gUnknown_085C7438 + 0x97d
    .4byte gUnknown_085C7438 + 0x9a1
    .4byte gUnknown_085C7438 + 0x9c5
    .4byte gUnknown_085C7438 + 0x9e9
    .4byte gUnknown_085C7438 + 0xa19
    .4byte gUnknown_085C7438 + 0xa49
    .4byte gUnknown_085C7438 + 0xa79
    .4byte gUnknown_085C7438 + 0xab5
    .4byte gUnknown_085C7438 + 0xaf1
    .4byte gUnknown_085C7438 + 0xb2d
    .4byte gUnknown_085C7438 + 0xb75
    .4byte gUnknown_085C7438 + 0xbbd
    .4byte gUnknown_085C7438 + 0xc05
    .4byte gUnknown_085C7438 + 0xc4d
    .4byte gUnknown_085C7438 + 0xc95
    .4byte gUnknown_085C7438 + 0xcdd
    .4byte 0x70000000 + gUnknown_085C7438 + 0xd27
    .4byte 0x84000013
    .4byte 0x70000000 + gUnknown_085C7438 + 0x91f
    .4byte 0x84000013
    .4byte 0x80000000

	.global gUnknown_085C8278
gUnknown_085C8278:  @ 0x085C8278
	.incbin "baserom.gba", 0x5C8278, 0xFF8

	.global gUnknown_085C9270
gUnknown_085C9270:  @ 0x085C9270
@ Replacing .incbin "baserom.gba", 0x5C9270, 0x30
    .4byte gUnknown_085C8278 + 0x802
    .4byte gUnknown_085C8278 + 0x832
    .4byte gUnknown_085C8278 + 0x87a
    .4byte gUnknown_085C8278 + 0x8ce
    .4byte gUnknown_085C8278 + 0x922
    .4byte gUnknown_085C8278 + 0x976
    .4byte gUnknown_085C8278 + 0x9ca
    .4byte gUnknown_085C8278 + 0xa1e
    .4byte gUnknown_085C8278 + 0xa72
    .4byte gUnknown_085C8278 + 0xac6
    .4byte gUnknown_085C8278 + 0xb1a
    .4byte 0x80000000

	.global gUnknown_085C92A0
gUnknown_085C92A0:  @ 0x085C92A0
@ Replacing .incbin "baserom.gba", 0x5C92A0, 0x30
    .4byte gUnknown_085C8278 + 0xb6d
    .4byte gUnknown_085C8278 + 0xb91
    .4byte gUnknown_085C8278 + 0xbc1
    .4byte gUnknown_085C8278 + 0xbf2
    .4byte gUnknown_085C8278 + 0xc22
    .4byte gUnknown_085C8278 + 0xc53
    .4byte gUnknown_085C8278 + 0xc22
    .4byte gUnknown_085C8278 + 0xc82
    .4byte gUnknown_085C8278 + 0xcb1
    .4byte 0x60000000 + gUnknown_085C8278 + 0xce0
    .4byte 0x20000000 + gUnknown_085C8278 + 0xd10
    .4byte 0x80000000

	.global gUnknown_085C92D0
gUnknown_085C92D0:  @ 0x085C92D0
	.incbin "baserom.gba", 0x5C92D0, 0x1C

	.global gUnknown_085C92EC
gUnknown_085C92EC:  @ 0x085C92EC
@ Replacing .incbin "baserom.gba", 0x5C92EC, 0x3C
    .4byte gUnknown_085C8278 + 0xe91
    .4byte 0x10000000 + gUnknown_085C8278 + 0xd88
    .4byte 0x80000000
    .4byte gUnknown_085C8278 + 0xda1
    .4byte gUnknown_085C8278 + 0xdb9
    .4byte gUnknown_085C8278 + 0xdd1
    .4byte gUnknown_085C8278 + 0xdea
    .4byte gUnknown_085C8278 + 0xe02
    .4byte gUnknown_085C8278 + 0xe1b
    .4byte gUnknown_085C8278 + 0xe02
    .4byte gUnknown_085C8278 + 0xe32
    .4byte gUnknown_085C8278 + 0xe49
    .4byte 0x60000000 + gUnknown_085C8278 + 0xe60
    .4byte 0x20000000 + gUnknown_085C8278 + 0xe78
    .4byte 0x80000000

	.global gUnknown_085C9328
gUnknown_085C9328:  @ 0x085C9328
@ Replacing .incbin "baserom.gba", 0x5C9328, 0x6848
    .4byte 0x10000000 + gUnknown_085C8278 + 0xe9c
    .4byte gUnknown_085C8278 + 0xec2
    .4byte gUnknown_085C8278 + 0xee5
    .4byte gUnknown_085C8278 + 0xf09
    .4byte gUnknown_085C8278 + 0xf2d
    .4byte gUnknown_085C8278 + 0xf51
    .4byte gUnknown_085C8278 + 0xf69
    .4byte gUnknown_085C8278 + 0xf8d
    .4byte gUnknown_085C8278 + 0xfb1
    .4byte gUnknown_085C8278 + 0xfd5
    .4byte gUnknown_085C8278 + 0xe91
    .4byte 0x10000000 + gUnknown_085C8278 + 0xd88
    .4byte 0x80000000

	.global Img_EfxSkill1
Img_EfxSkill1:  @ 0x085C935C
    .incbin "baserom.gba", 0x5C935C, 0x5C9740 - 0x5C935C

	.global Img_EfxSkill2
Img_EfxSkill2:
    .incbin "baserom.gba", 0x5C9740, 0x5C9B38 - 0x5C9740

	.global Img_EfxSkill3
Img_EfxSkill3:
    .incbin "baserom.gba", 0x5C9B38, 0x5C9F48 - 0x5C9B38

	.global Img_EfxSkill4
Img_EfxSkill4:
    .incbin "baserom.gba", 0x5C9F48, 0x5CA380 - 0x5C9F48

	.global Img_EfxSkill5
Img_EfxSkill5:
    .incbin "baserom.gba", 0x5CA380, 0x5CA7FC - 0x5CA380

	.global Img_EfxSkill6
Img_EfxSkill6:
    .incbin "baserom.gba", 0x5CA7FC, 0x5CACF4 - 0x5CA7FC

	.global Img_EfxSkill7
Img_EfxSkill7:
    .incbin "baserom.gba", 0x5CACF4, 0x5CB2CC - 0x5CACF4

	.global Img_EfxSkill8
Img_EfxSkill8:
    .incbin "baserom.gba", 0x5CB2CC, 0x5CB9AC - 0x5CB2CC

	.global Img_EfxSkill9
Img_EfxSkill9:
    .incbin "baserom.gba", 0x5CB9AC, 0x5CC0E8 - 0x5CB9AC

	.global Img_EfxSkillA
Img_EfxSkillA:
    .incbin "baserom.gba", 0x5CC0E8, 0x5CC820 - 0x5CC0E8

	.global Img_EfxSkillB
Img_EfxSkillB:
    .incbin "baserom.gba", 0x5CC820, 0x5CCF14 - 0x5CC820

	.global Img_EfxSkillC
Img_EfxSkillC:
    .incbin "baserom.gba", 0x5CCF14, 0x5CD5A0 - 0x5CCF14

	.global Img_EfxSkillD
Img_EfxSkillD:
    .incbin "baserom.gba", 0x5CD5A0, 0x5CDC00 - 0x5CD5A0

	.global Img_EfxSkillE
Img_EfxSkillE:
    .incbin "baserom.gba", 0x5CDC00, 0x5CE200 - 0x5CDC00

	.global Img_EfxSkillF
Img_EfxSkillF:
    .incbin "baserom.gba", 0x5CE200, 0x5CE7C4 - 0x5CE200

	.global Img_EfxSkill10
Img_EfxSkill10:
    .incbin "baserom.gba", 0x5CE7C4, 0x5CEC6C - 0x5CE7C4

	.global Pal_EfxSkill1
Pal_EfxSkill1:
    .incbin "baserom.gba", 0x5CEC6C, 0x5CEC8C - 0x5CEC6C

	.global Pal_EfxSkill2
Pal_EfxSkill2:
    .incbin "baserom.gba", 0x5CEC8C, 0x5CECAC - 0x5CEC8C

	.global Pal_EfxSkill3
Pal_EfxSkill3:
    .incbin "baserom.gba", 0x5CECAC, 0x5CECCC - 0x5CECAC

	.global Pal_EfxSkill4
Pal_EfxSkill4:
    .incbin "baserom.gba", 0x5CECCC, 0x5CECEC - 0x5CECCC

	.global Pal_EfxSkill5
Pal_EfxSkill5:
    .incbin "baserom.gba", 0x5CECEC, 0x5CED0C - 0x5CECEC

	.global Pal_EfxSkill6
Pal_EfxSkill6:
    .incbin "baserom.gba", 0x5CED0C, 0x5CED2C - 0x5CED0C

	.global Pal_EfxSkill7
Pal_EfxSkill7:
    .incbin "baserom.gba", 0x5CED2C, 0x5CED4C - 0x5CED2C

	.global Pal_EfxSkill8
Pal_EfxSkill8:
    .incbin "baserom.gba", 0x5CED4C, 0x5CED6C - 0x5CED4C

	.global Pal_EfxSkill9
Pal_EfxSkill9:
    .incbin "baserom.gba", 0x5CED6C, 0x5CED8C - 0x5CED6C

	.global Pal_EfxSkillA
Pal_EfxSkillA:
    .incbin "baserom.gba", 0x5CED8C, 0x5CEDAC - 0x5CED8C

	.global Pal_EfxSkillB
Pal_EfxSkillB:
    .incbin "baserom.gba", 0x5CEDAC, 0x5CEDCC - 0x5CEDAC

	.global Pal_EfxSkillC
Pal_EfxSkillC:
    .incbin "baserom.gba", 0x5CEDCC, 0x5CEDEC - 0x5CEDCC

	.global Pal_EfxSkillD
Pal_EfxSkillD:
    .incbin "baserom.gba", 0x5CEDEC, 0x5CEE0C - 0x5CEDEC

	.global Pal_EfxSkillE
Pal_EfxSkillE:
    .incbin "baserom.gba", 0x5CEE0C, 0x5CEE2C - 0x5CEE0C

	.global Pal_EfxSkillF
Pal_EfxSkillF:
    .incbin "baserom.gba", 0x5CEE2C, 0x5CEE4C - 0x5CEE2C

	.global Pal_EfxSkill10
Pal_EfxSkill10:
    .incbin "baserom.gba", 0x5CEE4C, 0x5CEE6C - 0x5CEE4C

	.global Tsa_EfxSkill1
Tsa_EfxSkill1:
    .incbin "baserom.gba", 0x5CEE6C, 0x5CEF04 - 0x5CEE6C

	.global Tsa_EfxSkill2
Tsa_EfxSkill2:
    .incbin "baserom.gba", 0x5CEF04, 0x5CEFA4 - 0x5CEF04

	.global Tsa_EfxSkill3
Tsa_EfxSkill3:
    .incbin "baserom.gba", 0x5CEFA4, 0x5CF044 - 0x5CEFA4

	.global Tsa_EfxSkill4
Tsa_EfxSkill4:
    .incbin "baserom.gba", 0x5CF044, 0x5CF0E8 - 0x5CF044

	.global Tsa_EfxSkill5
Tsa_EfxSkill5:
    .incbin "baserom.gba", 0x5CF0E8, 0x5CF1A0 - 0x5CF0E8

	.global Tsa_EfxSkill6
Tsa_EfxSkill6:
    .incbin "baserom.gba", 0x5CF1A0, 0x5CF264 - 0x5CF1A0

	.global Tsa_EfxSkill7
Tsa_EfxSkill7:
    .incbin "baserom.gba", 0x5CF264, 0x5CF33C - 0x5CF264

	.global Tsa_EfxSkill8
Tsa_EfxSkill8:
    .incbin "baserom.gba", 0x5CF33C, 0x5CF440 - 0x5CF33C

	.global Tsa_EfxSkill9
Tsa_EfxSkill9:
    .incbin "baserom.gba", 0x5CF440, 0x5CF544 - 0x5CF440

	.global Tsa_EfxSkillA
Tsa_EfxSkillA:
    .incbin "baserom.gba", 0x5CF544, 0x5CF648 - 0x5CF544

	.global Tsa_EfxSkillB
Tsa_EfxSkillB:
    .incbin "baserom.gba", 0x5CF648, 0x5CF750 - 0x5CF648

	.global Tsa_EfxSkillC
Tsa_EfxSkillC:
    .incbin "baserom.gba", 0x5CF750, 0x5CF83C - 0x5CF750

	.global Tsa_EfxSkillD
Tsa_EfxSkillD:
    .incbin "baserom.gba", 0x5CF83C, 0x5CF91C - 0x5CF83C

	.global Tsa_EfxSkillE
Tsa_EfxSkillE:
    .incbin "baserom.gba", 0x5CF91C, 0x5CF9F4 - 0x5CF91C

	.global Tsa_EfxSkillF
Tsa_EfxSkillF:
    .incbin "baserom.gba", 0x5CF9F4, 0x5CFAC0 - 0x5CF9F4

	.global Tsa_EfxSkill10
Tsa_EfxSkill10:
    .incbin "baserom.gba", 0x5CFAC0, 0x5CFB70 - 0x5CFAC0

	.global gUnknown_085CFB70
gUnknown_085CFB70:  @ 0x085CFB70
	.incbin "baserom.gba", 0x5CFB70, 0xCB0

	.global gUnknown_085D0820
gUnknown_085D0820:  @ 0x085D0820
	.incbin "baserom.gba", 0x5D0820, 0x200

	.global gUnknown_085D0A20
gUnknown_085D0A20:  @ 0x085D0A20
	.incbin "baserom.gba", 0x5D0A20, 0x2C0

	.global gUnknown_085D0CE0
gUnknown_085D0CE0:  @ 0x085D0CE0
	.incbin "baserom.gba", 0x5D0CE0, 0x2F0

	.global gUnknown_085D0FD0
gUnknown_085D0FD0:  @ 0x085D0FD0
	.incbin "baserom.gba", 0x5D0FD0, 0x4A0

	.global gUnknown_085D1470
gUnknown_085D1470:  @ 0x085D1470
@ Replacing .incbin "baserom.gba", 0x5D1470, 0x39F0
    .4byte 0x7fff5355
    .4byte 0x7f007ff8
    .4byte 0x54007d40
    .4byte 0x137f3400
    .4byte 0x001801ff
    .4byte 0x0007000c
    .4byte 0x33ec63f7
    .4byte 0x016012a4
    .4byte 0x0004b010
    .4byte 0xf000003f
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0xff01f001
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0xf001f0ff
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0x01f0e101
    .4byte 0x01f001f0
    .4byte 0x08230472
    .4byte 0x231c0710
    .4byte 0x1cf0720c
    .4byte 0x01a001f0
    .4byte 0x02000403
    .4byte 0x01040104
    .4byte 0x70000200
    .4byte 0xf01cf003
    .4byte 0x0501c001
    .4byte 0x1c040404
    .4byte 0xf0050004
    .4byte 0xf001f018
    .4byte 0x0f040c3b
    .4byte 0x0508040c
    .4byte 0x01f0b920
    .4byte 0xb38001f0
    .4byte 0x0c020c00
    .4byte 0x08010c01
    .4byte 0x03083902
    .4byte 0x01f03df0
    .4byte 0x230c2bb1
    .4byte 0x231f0720
    .4byte 0x3bf07204
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0xf001f0ff
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0x01f0ff01
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0xf0f001f0
    .4byte 0xf001f001
    .4byte 0x00012001
    .4byte 0x0004b010
    .4byte 0xf000003f
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0xff01f001
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x07019084
    .4byte 0xd0040604
    .4byte 0x60000613
    .4byte 0xf028f007
    .4byte 0x040a0001
    .4byte 0x08410409
    .4byte 0x00083da0
    .4byte 0xf00a0009
    .4byte 0x01f0c128
    .4byte 0x040d0100
    .4byte 0x600b040c
    .4byte 0x000b073d
    .4byte 0xf00d000c
    .4byte 0x4001f024
    .4byte 0x04100401
    .4byte 0x200e040f
    .4byte 0x1c000e3d
    .4byte 0xf010000f
    .4byte 0x8001f020
    .4byte 0x47041201
    .4byte 0x113b2011
    .4byte 0x1cf01200
    .4byte 0x01f001f0
    .4byte 0x270100bc
    .4byte 0x01f012f0
    .4byte 0x012001f0
    .4byte 0x2b71002a
    .4byte 0x01f03ff0
    .4byte 0x110cb3b0
    .4byte 0x1cb3200c
    .4byte 0xf0081208
    .4byte 0x8101f03f
    .4byte 0x200f0c2b
    .4byte 0x3b200e0c
    .4byte 0x080f080e
    .4byte 0xf0087010
    .4byte 0x4101f07f
    .4byte 0x0c0c0ca3
    .4byte 0x3920c30b
    .4byte 0x0c08a321
    .4byte 0x3d000d08
    .4byte 0xf0833ff0
    .4byte 0x090c0a01
    .4byte 0x3960080c
    .4byte 0x080f1b22
    .4byte 0x200a0809
    .4byte 0xf03f303d
    .4byte 0x33936233
    .4byte 0x39a0060c
    .4byte 0x07089322
    .4byte 0x01f03b40
    .4byte 0xf001f0ff
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0x01f0f801
    .4byte 0x01f001f0
    .4byte 0x017001f0
    .4byte 0x0004b010
    .4byte 0xf000003e
    .4byte 0xf001f001
    .4byte 0x3001f001
    .4byte 0x04181401
    .4byte 0x15f00413
    .4byte 0x00130170
    .4byte 0x14f0c114
    .4byte 0x04170140
    .4byte 0xf0150416
    .4byte 0x0140833d
    .4byte 0x00160015
    .4byte 0x6016f017
    .4byte 0x041a0601
    .4byte 0xf0180419
    .4byte 0x1801003d
    .4byte 0x0019000c
    .4byte 0xa016f01a
    .4byte 0x10041d01
    .4byte 0xe01b041c
    .4byte 0x1c001b3d
    .4byte 0xf01d6000
    .4byte 0x1f01e02c
    .4byte 0x22041e04
    .4byte 0x223da083
    .4byte 0x1f001e00
    .4byte 0x01f028f0
    .4byte 0x21010088
    .4byte 0x3ba02004
    .4byte 0xff210020
    .4byte 0x01f024f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x6001f0c7
    .4byte 0x26003301
    .4byte 0x01f014f0
    .4byte 0x108701f0
    .4byte 0x0036083b
    .4byte 0xf03ff037
    .4byte 0x9f01f001
    .4byte 0x0c270120
    .4byte 0x01f03ff0
    .4byte 0x3ff001f0
    .4byte 0xc18801f0
    .4byte 0x0c200ca3
    .4byte 0x2108a3a1
    .4byte 0x3ff0e108
    .4byte 0x1b0201f0
    .4byte 0x220c1e0c
    .4byte 0x22073ba0
    .4byte 0x1f081e08
    .4byte 0x3f503d00
    .4byte 0x428633f0
    .4byte 0x0c1c0c93
    .4byte 0x2239a01b
    .4byte 0x1c1e0893
    .4byte 0x3d201d08
    .4byte 0x35f03f10
    .4byte 0x180c0b23
    .4byte 0xf0180c19
    .4byte 0x080b131b
    .4byte 0x1a700819
    .4byte 0x01f03d40
    .4byte 0x160c8303
    .4byte 0xf0c3150c
    .4byte 0x08835339
    .4byte 0xf0170816
    .4byte 0x33fb533d
    .4byte 0x39f0130c
    .4byte 0x1408fb93
    .4byte 0x01f03bf0
    .4byte 0x8001f0c0
    .4byte 0x00000001
    .4byte 0x0004b010
    .4byte 0xd0000021
    .4byte 0x13041401
    .4byte 0x8c15f004
    .4byte 0x001301b0
    .4byte 0x0014f014
    .4byte 0x18041701
    .4byte 0xf0150416
    .4byte 0x1501803d
    .4byte 0x00301600
    .4byte 0x2016f017
    .4byte 0x19041a01
    .4byte 0xf0186004
    .4byte 0x1801403d
    .4byte 0x1a001900
    .4byte 0x6016f0c1
    .4byte 0x1c041d01
    .4byte 0x3df01b04
    .4byte 0x1b010083
    .4byte 0x1d001c00
    .4byte 0x01a016f0
    .4byte 0x1e041f04
    .4byte 0x3de02204
    .4byte 0x1e180022
    .4byte 0x2cf01f00
    .4byte 0x042101e0
    .4byte 0x3be08f20
    .4byte 0xf0210020
    .4byte 0xf001f028
    .4byte 0xff01f001
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x2401a083
    .4byte 0x26002500
    .4byte 0x01f016f0
    .4byte 0x0001f081
    .4byte 0x00280824
    .4byte 0xe13ff029
    .4byte 0x01f001f0
    .4byte 0x0c270100
    .4byte 0x3ff0002c
    .4byte 0xf001f0ff
    .4byte 0xf03ff001
    .4byte 0xf001f01d
    .4byte 0xf03ff03f
    .4byte 0x0c210801
    .4byte 0x1be20c20
    .4byte 0xe1082108
    .4byte 0x33f03f70
    .4byte 0x1e0c9342
    .4byte 0x3be0220c
    .4byte 0x1e082207
    .4byte 0x3d001f08
    .4byte 0x35f03f30
    .4byte 0x0c0b2386
    .4byte 0xe01b0c1c
    .4byte 0x080b2339
    .4byte 0x1d081c1c
    .4byte 0x01f03d20
    .4byte 0x190c8323
    .4byte 0xf0180c30
    .4byte 0x08835339
    .4byte 0xc31a0819
    .4byte 0xfb333df0
    .4byte 0x150c160c
    .4byte 0xfb9339f0
    .4byte 0x0816080c
    .4byte 0x143df017
    .4byte 0xc8130c73
    .4byte 0x73d439f0
    .4byte 0x3b001408
    .4byte 0x0004b010
    .4byte 0xb0000020
    .4byte 0x16041701
    .4byte 0x04601504
    .4byte 0x01d015d0
    .4byte 0x00160015
    .4byte 0x16f08117
    .4byte 0x19041a00
    .4byte 0x3df01804
    .4byte 0x18018083
    .4byte 0x1a001900
    .4byte 0x012016f0
    .4byte 0x1c041d06
    .4byte 0x3df01b04
    .4byte 0x0c1b0140
    .4byte 0x1d001c00
    .4byte 0x016016f0
    .4byte 0x1e18041f
    .4byte 0x3df02204
    .4byte 0x00220100
    .4byte 0x1f00311e
    .4byte 0x01a016f0
    .4byte 0xf0200421
    .4byte 0x01008f3b
    .4byte 0xf0210020
    .4byte 0xf001f014
    .4byte 0xff01f001
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x2d01808f
    .4byte 0x14f02e00
    .4byte 0x01f001f0
    .4byte 0x2f070100
    .4byte 0x31003000
    .4byte 0x01f03ff0
    .4byte 0x000301f0
    .4byte 0x0032082f
    .4byte 0xf03ff032
    .4byte 0x01f08101
    .4byte 0x34082d00
    .4byte 0x3d003500
    .4byte 0xf03ff0e1
    .4byte 0x0001f001
    .4byte 0xf00c2600
    .4byte 0x01f0ff3f
    .4byte 0x3ff001f0
    .4byte 0x1ff03f10
    .4byte 0x3ff001f0
    .4byte 0xf0c63f30
    .4byte 0x0c93421b
    .4byte 0x15f00c20
    .4byte 0x38089302
    .4byte 0x3f500821
    .4byte 0x0b231df0
    .4byte 0x610c1e0c
    .4byte 0x133bf022
    .4byte 0x081e080b
    .4byte 0xe13d001f
    .4byte 0x1df03f10
    .4byte 0x1c0c8303
    .4byte 0x19f01b0c
    .4byte 0x08835386
    .4byte 0x201d081c
    .4byte 0x1a01f03d
    .4byte 0x0c190c0c
    .4byte 0x9339f018
    .4byte 0x201908fb
    .4byte 0x3df01a08
    .4byte 0x160c1700
    .4byte 0xf015600c
    .4byte 0x0873d439
    .4byte 0x08170816
    .4byte 0x0004b010
    .4byte 0xb0000020
    .4byte 0x19041a01
    .4byte 0x04601804
    .4byte 0x01d015d0
    .4byte 0x00190018
    .4byte 0x16f0811a
    .4byte 0x1c041d00
    .4byte 0x3df01b04
    .4byte 0x1b018083
    .4byte 0x1d001c00
    .4byte 0x012016f0
    .4byte 0x1e041f06
    .4byte 0x3df02204
    .4byte 0x0c220140
    .4byte 0x1f001e00
    .4byte 0x016016f0
    .4byte 0x20630421
    .4byte 0x01403bf0
    .4byte 0xf0210020
    .4byte 0xff01f014
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0xf001f0ff
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0x01f0c101
    .4byte 0x00380120
    .4byte 0xf03a0039
    .4byte 0x01f0c016
    .4byte 0x3b0001f0
    .4byte 0x3d003c00
    .4byte 0x003e000e
    .4byte 0xf01af02e
    .4byte 0x3f01c001
    .4byte 0x00400000
    .4byte 0x00420041
    .4byte 0x3ff0e043
    .4byte 0x01e001f0
    .4byte 0x0c250c26
    .4byte 0x460c0329
    .4byte 0x48004700
    .4byte 0x01f03ff0
    .4byte 0x003ff0c1
    .4byte 0x4d004c3f
    .4byte 0x3f204e00
    .4byte 0xf01ff0ef
    .4byte 0x523ff001
    .4byte 0x1bf03f20
    .4byte 0x01f001f0
    .4byte 0xf03f30e3
    .4byte 0x0c0b2317
    .4byte 0x15f00c20
    .4byte 0x081c0b43
    .4byte 0x3f300821
    .4byte 0x83031bf0
    .4byte 0x0c301e0c
    .4byte 0x5319f022
    .4byte 0x081e0883
    .4byte 0x3d20c11f
    .4byte 0x0c1d01f0
    .4byte 0xf01b0c1c
    .4byte 0xfb938439
    .4byte 0x1d081c08
    .4byte 0x1a003df0
    .4byte 0x0c190c0c
    .4byte 0xd439f018
    .4byte 0x00190873
    .4byte 0x00081a08
    .4byte 0x0004b010
    .4byte 0xb0000020
    .4byte 0x1c041d01
    .4byte 0x04601b04
    .4byte 0x01d015d0
    .4byte 0x001c001b
    .4byte 0x16f0811d
    .4byte 0x1e041f00
    .4byte 0x3df02204
    .4byte 0x22018083
    .4byte 0x1f001e00
    .4byte 0x012016f0
    .4byte 0x20042118
    .4byte 0x01803bf0
    .4byte 0xff210020
    .4byte 0x01f014f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0xf001f0ff
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0x01f0ff01
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0xf0c001f0
    .4byte 0x0001f001
    .4byte 0x00390038
    .4byte 0x16f0e03a
    .4byte 0x01f001f0
    .4byte 0x3c003b00
    .4byte 0x005b1c00
    .4byte 0xf03ff05c
    .4byte 0x3f01e001
    .4byte 0x00610100
    .4byte 0x00630062
    .4byte 0xc03ff064
    .4byte 0x01e001f0
    .4byte 0x00670c26
    .4byte 0x69070068
    .4byte 0x6b006a00
    .4byte 0x1ff03f00
    .4byte 0xf08301f0
    .4byte 0x6f006e3f
    .4byte 0x1af07000
    .4byte 0xf0df01f0
    .4byte 0x713f2001
    .4byte 0x01f016f0
    .4byte 0x3f4001f0
    .4byte 0x039813f0
    .4byte 0xf0200c83
    .4byte 0x08839317
    .4byte 0xf0c30821
    .4byte 0x0cfb2315
    .4byte 0xf0220c1e
    .4byte 0x08fb933b
    .4byte 0x1f081e08
    .4byte 0x1d003df0
    .4byte 0x0c1c180c
    .4byte 0xd439f01b
    .4byte 0x081c0873
    .4byte 0x00081d00
    .4byte 0x0004b010
    .4byte 0xb0000020
    .4byte 0x1e041f01
    .4byte 0x04602204
    .4byte 0x01d015d0
    .4byte 0x001e0022
    .4byte 0x16f0861f
    .4byte 0x20042100
    .4byte 0x01c03bf0
    .4byte 0x21003f20
    .4byte 0x01f014f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0xf001f0ff
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0x01f0ff01
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0xf0ff01f0
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0xe001f001
    .4byte 0x01f001f0
    .4byte 0x003801c0
    .4byte 0xe0450044
    .4byte 0x01f016f0
    .4byte 0x3b0001f0
    .4byte 0x1c004900
    .4byte 0xf04b004a
    .4byte 0xe001f03f
    .4byte 0x47003f01
    .4byte 0x503b004f
    .4byte 0x3f005100
    .4byte 0x01f01df0
    .4byte 0x5301b088
    .4byte 0x3f005400
    .4byte 0xf7560055
    .4byte 0x01f01af0
    .4byte 0x3f2001f0
    .4byte 0xf016f057
    .4byte 0xfc01f001
    .4byte 0x13f03f40
    .4byte 0x01f001f0
    .4byte 0xfb4301f0
    .4byte 0x0c62200c
    .4byte 0xfbc315f0
    .4byte 0xf0082108
    .4byte 0x0c0c1f15
    .4byte 0xf0220c1e
    .4byte 0x0873d43b
    .4byte 0x1f08001e
    .4byte 0x00000008
    .4byte 0x0004b010
    .4byte 0xb0000021
    .4byte 0x20042101
    .4byte 0x8313d004
    .4byte 0x000001f0
    .4byte 0xf0210020
    .4byte 0xff01f014
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0xf001f0ff
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0x01f0ff01
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0xf0ff01f0
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0xfc01f001
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x018001f0
    .4byte 0x591c0058
    .4byte 0x16f05a00
    .4byte 0x01f001f0
    .4byte 0x00035d00
    .4byte 0x005f005e
    .4byte 0xf018f060
    .4byte 0x01e08b01
    .4byte 0x00660065
    .4byte 0x18f05f3b
    .4byte 0xf08701f0
    .4byte 0x006c0001
    .4byte 0xf03f006d
    .4byte 0xff01f017
    .4byte 0x3f3001f0
    .4byte 0x01f013f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x8401f0c6
    .4byte 0x0c200c73
    .4byte 0x01f015f0
    .4byte 0x21080020
    .4byte 0x00000008
    .4byte 0x0004b010
    .4byte 0xf000003f
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0xff01f001
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0xf001f0ff
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0x01f0ff01
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0xf0ff01f0
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0xff01f001
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0xf001f0ff
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0x01f0ff01
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0xf0f801f0
    .4byte 0xf001f001
    .4byte 0x7001f001
    .4byte 0x00000001
    .4byte 0x40000000
    .4byte 0xfff00000
    .4byte 0x0000fff8
    .4byte 0x40000000
    .4byte 0x00000000
    .4byte 0x0000fff8
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x80004000
    .4byte 0xffe60009
    .4byte 0x00000001
    .4byte 0x00004000
    .4byte 0x00060002
    .4byte 0x00000001
    .4byte 0x00004000
    .4byte 0xffe60022
    .4byte 0x0000fff9
    .4byte 0x80004000
    .4byte 0xfff60004
    .4byte 0x0000fff1
    .4byte 0x00008000
    .4byte 0x00160008
    .4byte 0x0000fff1
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x80004000
    .4byte 0x00010010
    .4byte 0x0000fff0
    .4byte 0x80004000
    .4byte 0xfff10010
    .4byte 0x00000000
    .4byte 0x60000000
    .4byte 0x00110012
    .4byte 0x0000ffe0
    .4byte 0x70000000
    .4byte 0xfff10012
    .4byte 0x0000fff0
    .4byte 0x70000000
    .4byte 0x00010012
    .4byte 0x0000ffe0
    .4byte 0x40000000
    .4byte 0xfff10012
    .4byte 0x00000010
    .4byte 0x50000000
    .4byte 0xffe10012
    .4byte 0x00000010
    .4byte 0x70000000
    .4byte 0xffe10012
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x80004000
    .4byte 0xfff80014
    .4byte 0x0000ffdb
    .4byte 0x80004000
    .4byte 0xfff80018
    .4byte 0x0000ffeb
    .4byte 0x80004000
    .4byte 0xffe9001c
    .4byte 0x0000000b
    .4byte 0x00004000
    .4byte 0xffe90040
    .4byte 0x0000001b
    .4byte 0x00000000
    .4byte 0xfff90042
    .4byte 0x0000001b
    .4byte 0x80004000
    .4byte 0xfff0001c
    .4byte 0x0000fffb
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff50000
    .4byte 0x0000fff8
    .4byte 0x40000000
    .4byte 0xfff50000
    .4byte 0x0000ffe8
    .4byte 0x40000000
    .4byte 0xfff50000
    .4byte 0x0000ffd8
    .4byte 0x40000000
    .4byte 0xfff50000
    .4byte 0x00000008
    .4byte 0x00004000
    .4byte 0xfff5000d
    .4byte 0x0000ffd0
    .4byte 0x00008000
    .4byte 0x0005000f
    .4byte 0x0000ffd8
    .4byte 0x00008000
    .4byte 0x0005000f
    .4byte 0x0000ffe8
    .4byte 0x00008000
    .4byte 0x0005000f
    .4byte 0x0000fff8
    .4byte 0x00008000
    .4byte 0x0005000f
    .4byte 0x00000008
    .4byte 0x00008000
    .4byte 0x0005000f
    .4byte 0x00000018
    .4byte 0x40000000
    .4byte 0xfff50000
    .4byte 0x00000018
    .4byte 0x20004000
    .4byte 0xfff5000d
    .4byte 0x00000028
    .4byte 0x20000000
    .4byte 0x0005002d
    .4byte 0x00000028
    .4byte 0x00000000
    .4byte 0x0005002d
    .4byte 0x0000ffd0
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x80004000
    .4byte 0xffdf008a
    .4byte 0x0000ffd0
    .4byte 0x80004000
    .4byte 0xffe7008e
    .4byte 0x0000ffe0
    .4byte 0x80004000
    .4byte 0xffee008e
    .4byte 0x0000fff0
    .4byte 0x80004000
    .4byte 0xfff5008e
    .4byte 0x00000000
    .4byte 0x80004000
    .4byte 0xfffc008e
    .4byte 0x00000010
    .4byte 0x80004000
    .4byte 0x00030092
    .4byte 0x00000020
    .4byte 0x40000000
    .4byte 0x000b0096
    .4byte 0x00000030
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x80004000
    .4byte 0xffd00045
    .4byte 0x0000ffe0
    .4byte 0x80004000
    .4byte 0xffe00045
    .4byte 0x0000fff0
    .4byte 0x80004000
    .4byte 0xfff00045
    .4byte 0x00000000
    .4byte 0x80004000
    .4byte 0x00000045
    .4byte 0x00000010
    .4byte 0x00004000
    .4byte 0xffc90060
    .4byte 0x0000ffd8
    .4byte 0x00000000
    .4byte 0xffd90062
    .4byte 0x0000ffd8
    .4byte 0x40000000
    .4byte 0xfff00043
    .4byte 0x0000ffe0
    .4byte 0x00004000
    .4byte 0xffe10049
    .4byte 0x0000ffd8
    .4byte 0x40000000
    .4byte 0x00000043
    .4byte 0x0000fff0
    .4byte 0x40000000
    .4byte 0x00100043
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0x0020004b
    .4byte 0x00000010
    .4byte 0x40000000
    .4byte 0x0020004d
    .4byte 0x00000028
    .4byte 0x40000000
    .4byte 0x00100045
    .4byte 0x00000020
    .4byte 0x00004000
    .4byte 0x00200069
    .4byte 0x00000020
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x80004000
    .4byte 0xffc8004f
    .4byte 0x0000ffef
    .4byte 0x80004000
    .4byte 0xffe80053
    .4byte 0x0000ffef
    .4byte 0x40000000
    .4byte 0x00080057
    .4byte 0x0000ffef
    .4byte 0x80004000
    .4byte 0x0000004f
    .4byte 0x0000ffff
    .4byte 0x40004000
    .4byte 0xffc20085
    .4byte 0x0000ffe7
    .4byte 0x00000000
    .4byte 0xffe20089
    .4byte 0x0000ffe7
    .4byte 0x40000000
    .4byte 0xffb80083
    .4byte 0x0000ffef
    .4byte 0x80004000
    .4byte 0xffd8005a
    .4byte 0x0000ffff
    .4byte 0x00008000
    .4byte 0xfff8005e
    .4byte 0x0000ffff
    .4byte 0x80004000
    .4byte 0x0010005a
    .4byte 0x0000000f
    .4byte 0x00008000
    .4byte 0x0030005e
    .4byte 0x0000000f
    .4byte 0x40000000
    .4byte 0x00380081
    .4byte 0x0000000f
    .4byte 0x40000000
    .4byte 0x00200053
    .4byte 0x0000ffff
    .4byte 0x00008000
    .4byte 0x00300055
    .4byte 0x0000ffff
    .4byte 0x00008000
    .4byte 0x00380080
    .4byte 0x0000ffff
    .4byte 0x00000000
    .4byte 0x00080059
    .4byte 0x0000000f
    .4byte 0x00000000
    .4byte 0xffd00059
    .4byte 0x0000ffff
    .4byte 0x00000000
    .4byte 0x00180079
    .4byte 0x0000fff7
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000005f
    .4byte 0x00000003
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_085D1470 + 0x9c9
    .4byte gUnknown_085D1470 + 0x9ed
    .4byte gUnknown_085D1470 + 0xa35
    .4byte gUnknown_085D1470 + 0xaa1
    .4byte gUnknown_085D1470 + 0xaf5
    .4byte gUnknown_085D1470 + 0xba9
    .4byte gUnknown_085D1470 + 0xc09
    .4byte gUnknown_085D1470 + 0xcbd
    .4byte 0x80000000
    .4byte gUnknown_085D1470 + 0xcbd
    .4byte gUnknown_085D1470 + 0xc09
    .4byte gUnknown_085D1470 + 0xba9
    .4byte gUnknown_085D1470 + 0xaf5
    .4byte gUnknown_085D1470 + 0xaa1
    .4byte gUnknown_085D1470 + 0xa35
    .4byte gUnknown_085D1470 + 0x9ed
    .4byte gUnknown_085D1470 + 0x9c9
    .4byte 0x80000000
    .4byte 0x40000000
    .4byte 0xfff00000
    .4byte 0x0000fff8
    .4byte 0x40000000
    .4byte 0x00000000
    .4byte 0x0000fff8
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xffe80000
    .4byte 0x0000fff7
    .4byte 0x40000000
    .4byte 0xfff80000
    .4byte 0x0000fff7
    .4byte 0x40000000
    .4byte 0x00080000
    .4byte 0x0000fff7
    .4byte 0x00004000
    .4byte 0xffe80022
    .4byte 0x00000007
    .4byte 0x00004000
    .4byte 0xfff80022
    .4byte 0x00000007
    .4byte 0x00004000
    .4byte 0x00080022
    .4byte 0x00000007
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xffe80000
    .4byte 0x0000fff7
    .4byte 0x40000000
    .4byte 0xfff80000
    .4byte 0x0000fff7
    .4byte 0x40000000
    .4byte 0x00080000
    .4byte 0x0000fff7
    .4byte 0x40000000
    .4byte 0xffd80004
    .4byte 0x0000fff7
    .4byte 0x50000000
    .4byte 0x00180004
    .4byte 0x0000fff7
    .4byte 0x00004000
    .4byte 0xffd80006
    .4byte 0x00000007
    .4byte 0x00004000
    .4byte 0xffe80026
    .4byte 0x00000007
    .4byte 0x00004000
    .4byte 0xfff80026
    .4byte 0x00000007
    .4byte 0x00004000
    .4byte 0x00080026
    .4byte 0x00000007
    .4byte 0x10004000
    .4byte 0x00180006
    .4byte 0x00000007
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff00000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0xffe00000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0x00000000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0x00100000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0xffd00008
    .4byte 0x0000fff6
    .4byte 0x50000000
    .4byte 0x00200008
    .4byte 0x0000fff6
    .4byte 0x00004000
    .4byte 0xffd00006
    .4byte 0x00000006
    .4byte 0x10004000
    .4byte 0x00200006
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0xffe00026
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0xfff00026
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0x00000026
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0x00100026
    .4byte 0x00000006
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xffe80000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0xfff80000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0x00080000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0x00180000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0xffd80000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0xffc8000a
    .4byte 0x0000fff6
    .4byte 0x50000000
    .4byte 0x0028000a
    .4byte 0x0000fff6
    .4byte 0x00004000
    .4byte 0xffc8002c
    .4byte 0x00000006
    .4byte 0x10004000
    .4byte 0x0028002c
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0xffd80026
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0xffe80026
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0xfff80026
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0x00080026
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0x00180026
    .4byte 0x00000006
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xffe80000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0xfff80000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0x00080000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0x00180000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0xffd80000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0xffc8000f
    .4byte 0x0000fff6
    .4byte 0x50000000
    .4byte 0x0028000f
    .4byte 0x0000fff6
    .4byte 0x10000000
    .4byte 0x0038002e
    .4byte 0x0000fffe
    .4byte 0x00000000
    .4byte 0xffc0002e
    .4byte 0x0000fffe
    .4byte 0x00004000
    .4byte 0xffc0000c
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0xffd0000d
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0xffe0000d
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0xfff0000d
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0x0000000d
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0x0010000d
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0x0020000d
    .4byte 0x00000006
    .4byte 0x10004000
    .4byte 0x0030000c
    .4byte 0x00000006
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff00000
    .4byte 0x0000fff5
    .4byte 0x40000000
    .4byte 0x00000000
    .4byte 0x0000fff5
    .4byte 0x40000000
    .4byte 0x00100000
    .4byte 0x0000fff5
    .4byte 0x40000000
    .4byte 0x00200000
    .4byte 0x0000fff5
    .4byte 0x40000000
    .4byte 0xffe00000
    .4byte 0x0000fff5
    .4byte 0x40000000
    .4byte 0xffd00000
    .4byte 0x0000fff5
    .4byte 0x40000000
    .4byte 0xffb80011
    .4byte 0x0000fff5
    .4byte 0x00008000
    .4byte 0xffc80013
    .4byte 0x0000fff5
    .4byte 0x50000000
    .4byte 0x00380011
    .4byte 0x0000fff5
    .4byte 0x10008000
    .4byte 0x00300013
    .4byte 0x0000fff5
    .4byte 0x00004000
    .4byte 0xffb80014
    .4byte 0x00000005
    .4byte 0x10004000
    .4byte 0x00380014
    .4byte 0x00000005
    .4byte 0x00004000
    .4byte 0xffc80015
    .4byte 0x00000005
    .4byte 0x00004000
    .4byte 0xffd80015
    .4byte 0x00000005
    .4byte 0x00004000
    .4byte 0xffe80015
    .4byte 0x00000005
    .4byte 0x00004000
    .4byte 0xfff80015
    .4byte 0x00000005
    .4byte 0x00004000
    .4byte 0x00080015
    .4byte 0x00000005
    .4byte 0x00004000
    .4byte 0x00180015
    .4byte 0x00000005
    .4byte 0x00004000
    .4byte 0x00280015
    .4byte 0x00000005
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000011
    .4byte 0x0000fff8
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff80000
    .4byte 0x0000fff0
    .4byte 0x40000000
    .4byte 0xfff80000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00004000
    .4byte 0xfff80034
    .4byte 0x0000fffc
    .4byte 0x40000000
    .4byte 0xfff80017
    .4byte 0x00000004
    .4byte 0x70000000
    .4byte 0xfff90017
    .4byte 0x0000ffec
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff10040
    .4byte 0x0000fff0
    .4byte 0x00008000
    .4byte 0x00010042
    .4byte 0x0000fff0
    .4byte 0x30004000
    .4byte 0xfff90043
    .4byte 0x0000ffe8
    .4byte 0x30000000
    .4byte 0xfff10045
    .4byte 0x0000ffe8
    .4byte 0x40000000
    .4byte 0xfff60040
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00060042
    .4byte 0x00000000
    .4byte 0x00004000
    .4byte 0xfff60043
    .4byte 0x00000010
    .4byte 0x00000000
    .4byte 0x00060045
    .4byte 0x00000010
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff20049
    .4byte 0x0000fff4
    .4byte 0x00008000
    .4byte 0x0002004b
    .4byte 0x0000fff4
    .4byte 0x40000000
    .4byte 0xffea0046
    .4byte 0x0000ffe4
    .4byte 0x00008000
    .4byte 0xfffa0048
    .4byte 0x0000ffe4
    .4byte 0x70000000
    .4byte 0x00060046
    .4byte 0x0000000c
    .4byte 0x30008000
    .4byte 0xfffe0048
    .4byte 0x0000000c
    .4byte 0x70000000
    .4byte 0xfffe0049
    .4byte 0x0000fffc
    .4byte 0x30008000
    .4byte 0xfff6004b
    .4byte 0x0000fffc
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff0004d
    .4byte 0x0000fff0
    .4byte 0x40000000
    .4byte 0x0000004d
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xfff8006d
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000004e
    .4byte 0x0000fff8
    .4byte 0x00000000
    .4byte 0xfff0006f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xfff8006f
    .4byte 0x00000008
    .4byte 0x00004000
    .4byte 0xffe0004f
    .4byte 0x0000ffe8
    .4byte 0x00000000
    .4byte 0xffe8006d
    .4byte 0x0000fff0
    .4byte 0x00000000
    .4byte 0xffe8006f
    .4byte 0x0000fff8
    .4byte 0x00000000
    .4byte 0xffe0006f
    .4byte 0x0000fff0
    .4byte 0x00008000
    .4byte 0x0010004c
    .4byte 0x00000010
    .4byte 0x00000000
    .4byte 0x0010004e
    .4byte 0x00000008
    .4byte 0x00000000
    .4byte 0xfff0004e
    .4byte 0x0000ffe8
    .4byte 0x00000000
    .4byte 0x0008006d
    .4byte 0x00000010
    .4byte 0x00000000
    .4byte 0x0008006f
    .4byte 0x00000018
    .4byte 0x00000000
    .4byte 0x0000006f
    .4byte 0x00000010
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x80004000
    .4byte 0xffc80087
    .4byte 0x0000ffe8
    .4byte 0x00008000
    .4byte 0xffe8008b
    .4byte 0x0000ffe8
    .4byte 0x00004000
    .4byte 0xffd0008c
    .4byte 0x0000fff8
    .4byte 0x00000000
    .4byte 0xffe0008e
    .4byte 0x0000fff8
    .4byte 0x40000000
    .4byte 0xffe8008f
    .4byte 0x0000fff8
    .4byte 0x00004000
    .4byte 0xfff000a2
    .4byte 0x0000fff0
    .4byte 0x00008000
    .4byte 0xfff80091
    .4byte 0x0000fff8
    .4byte 0x00008000
    .4byte 0x0000008b
    .4byte 0x0000fff1
    .4byte 0x40000000
    .4byte 0x0000008f
    .4byte 0x00000001
    .4byte 0x00004000
    .4byte 0x000800a2
    .4byte 0x0000fff9
    .4byte 0x00008000
    .4byte 0x00100091
    .4byte 0x00000001
    .4byte 0x40000000
    .4byte 0x00180090
    .4byte 0x00000007
    .4byte 0x00008000
    .4byte 0x00280092
    .4byte 0x00000007
    .4byte 0x00000000
    .4byte 0x00280093
    .4byte 0x00000017
    .4byte 0x00004000
    .4byte 0x001800a2
    .4byte 0x0000ffff
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x80004000
    .4byte 0xffc40094
    .4byte 0x0000ffea
    .4byte 0x40000000
    .4byte 0xffe40098
    .4byte 0x0000ffea
    .4byte 0x80004000
    .4byte 0xffe4009a
    .4byte 0x0000fffa
    .4byte 0x40000000
    .4byte 0x002c005e
    .4byte 0x00000002
    .4byte 0x00004000
    .4byte 0x002c009e
    .4byte 0x00000012
    .4byte 0x00004000
    .4byte 0xfff400be
    .4byte 0x0000fff2
    .4byte 0x00004000
    .4byte 0xffcc00ac
    .4byte 0x0000fffa
    .4byte 0x00000000
    .4byte 0xffdc00ae
    .4byte 0x0000fffa
    .4byte 0x40000000
    .4byte 0x00040098
    .4byte 0x0000fff3
    .4byte 0x80004000
    .4byte 0x0004009a
    .4byte 0x00000003
    .4byte 0x00004000
    .4byte 0x001400be
    .4byte 0x0000fffb
    .4byte 0x00008000
    .4byte 0x0024009d
    .4byte 0x00000005
    .4byte 0x00000000
    .4byte 0x002400bf
    .4byte 0x0000fffd
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x80004000
    .4byte 0xffbc0055
    .4byte 0x0000ffee
    .4byte 0x00008000
    .4byte 0xffdc0059
    .4byte 0x0000ffee
    .4byte 0x80004000
    .4byte 0x0024005a
    .4byte 0x00000005
    .4byte 0x40004000
    .4byte 0xffe40051
    .4byte 0x0000ffee
    .4byte 0x40004000
    .4byte 0xffe40071
    .4byte 0x00000006
    .4byte 0x40000000
    .4byte 0xffe40000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0xfff40000
    .4byte 0x0000fff6
    .4byte 0x40004000
    .4byte 0xffbc0080
    .4byte 0x0000fffe
    .4byte 0x00000000
    .4byte 0xffdc0084
    .4byte 0x0000fffe
    .4byte 0x70004000
    .4byte 0x00040051
    .4byte 0x0000000a
    .4byte 0x70004000
    .4byte 0x00040071
    .4byte 0x0000fff2
    .4byte 0x70000000
    .4byte 0x00140000
    .4byte 0x0000fffa
    .4byte 0x70000000
    .4byte 0x00040000
    .4byte 0x0000fffa
    .4byte 0x40000000
    .4byte 0x00240085
    .4byte 0x0000fff5
    .4byte 0x00000000
    .4byte 0x003400a1
    .4byte 0x0000fffd
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x10004000
    .4byte 0xfff90034
    .4byte 0x0000fffc
    .4byte 0x50000000
    .4byte 0xfff90017
    .4byte 0x00000004
    .4byte 0x60000000
    .4byte 0xfff80017
    .4byte 0x0000ffec
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0xffff0040
    .4byte 0x0000fff0
    .4byte 0x10008000
    .4byte 0xfff70042
    .4byte 0x0000fff0
    .4byte 0x20004000
    .4byte 0xfff70043
    .4byte 0x0000ffe8
    .4byte 0x20000000
    .4byte 0x00070045
    .4byte 0x0000ffe8
    .4byte 0x50000000
    .4byte 0xfffa0040
    .4byte 0x00000000
    .4byte 0x10008000
    .4byte 0xfff20042
    .4byte 0x00000000
    .4byte 0x10004000
    .4byte 0xfffa0043
    .4byte 0x00000010
    .4byte 0x10000000
    .4byte 0xfff20045
    .4byte 0x00000010
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0xffff0049
    .4byte 0x0000fff4
    .4byte 0x10008000
    .4byte 0xfff7004b
    .4byte 0x0000fff4
    .4byte 0x50000000
    .4byte 0x00070046
    .4byte 0x0000ffe4
    .4byte 0x10008000
    .4byte 0xffff0048
    .4byte 0x0000ffe4
    .4byte 0x60000000
    .4byte 0xffeb0046
    .4byte 0x0000000c
    .4byte 0x20008000
    .4byte 0xfffb0048
    .4byte 0x0000000c
    .4byte 0x60000000
    .4byte 0xfff30049
    .4byte 0x0000fffc
    .4byte 0x20008000
    .4byte 0x0003004b
    .4byte 0x0000fffc
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0xffff004d
    .4byte 0x0000fff0
    .4byte 0x50000000
    .4byte 0xffef004d
    .4byte 0x00000000
    .4byte 0x10000000
    .4byte 0xffff006d
    .4byte 0x00000000
    .4byte 0x10000000
    .4byte 0xfff7004e
    .4byte 0x0000fff8
    .4byte 0x10000000
    .4byte 0x0007006f
    .4byte 0x00000000
    .4byte 0x10000000
    .4byte 0xffff006f
    .4byte 0x00000008
    .4byte 0x10004000
    .4byte 0x000f004f
    .4byte 0x0000ffe8
    .4byte 0x10000000
    .4byte 0x000f006d
    .4byte 0x0000fff0
    .4byte 0x10000000
    .4byte 0x000f006f
    .4byte 0x0000fff8
    .4byte 0x10000000
    .4byte 0x0017006f
    .4byte 0x0000fff0
    .4byte 0x10008000
    .4byte 0xffe7004c
    .4byte 0x00000010
    .4byte 0x10000000
    .4byte 0xffe7004e
    .4byte 0x00000008
    .4byte 0x10000000
    .4byte 0x0007004e
    .4byte 0x0000ffe8
    .4byte 0x10000000
    .4byte 0xffef006d
    .4byte 0x00000010
    .4byte 0x10000000
    .4byte 0xffef006f
    .4byte 0x00000018
    .4byte 0x10000000
    .4byte 0xfff7006f
    .4byte 0x00000010
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x90004000
    .4byte 0x00160087
    .4byte 0x0000ffe8
    .4byte 0x10008000
    .4byte 0x000e008b
    .4byte 0x0000ffe8
    .4byte 0x10004000
    .4byte 0x001e008c
    .4byte 0x0000fff8
    .4byte 0x10000000
    .4byte 0x0016008e
    .4byte 0x0000fff8
    .4byte 0x50000000
    .4byte 0x0006008f
    .4byte 0x0000fff8
    .4byte 0x10004000
    .4byte 0xfffe00a2
    .4byte 0x0000fff0
    .4byte 0x10008000
    .4byte 0xfffe0091
    .4byte 0x0000fff8
    .4byte 0x10008000
    .4byte 0xfff6008b
    .4byte 0x0000fff1
    .4byte 0x50000000
    .4byte 0xffee008f
    .4byte 0x00000001
    .4byte 0x10004000
    .4byte 0xffe600a2
    .4byte 0x0000fff9
    .4byte 0x10008000
    .4byte 0xffe60091
    .4byte 0x00000001
    .4byte 0x50000000
    .4byte 0xffd60090
    .4byte 0x00000007
    .4byte 0x10008000
    .4byte 0xffce0092
    .4byte 0x00000007
    .4byte 0x10000000
    .4byte 0xffce0093
    .4byte 0x00000017
    .4byte 0x10004000
    .4byte 0xffd600a2
    .4byte 0x0000ffff
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x90004000
    .4byte 0x001d0094
    .4byte 0x0000ffea
    .4byte 0x50000000
    .4byte 0x000d0098
    .4byte 0x0000ffea
    .4byte 0x90004000
    .4byte 0xfffd009a
    .4byte 0x0000fffa
    .4byte 0x50000000
    .4byte 0xffc5005e
    .4byte 0x00000002
    .4byte 0x10004000
    .4byte 0xffc5009e
    .4byte 0x00000012
    .4byte 0x10004000
    .4byte 0xfffd00be
    .4byte 0x0000fff2
    .4byte 0x10004000
    .4byte 0x002500ac
    .4byte 0x0000fffa
    .4byte 0x10000000
    .4byte 0x001d00ae
    .4byte 0x0000fffa
    .4byte 0x50000000
    .4byte 0xffed0098
    .4byte 0x0000fff3
    .4byte 0x90004000
    .4byte 0xffdd009a
    .4byte 0x00000003
    .4byte 0x10004000
    .4byte 0xffdd00be
    .4byte 0x0000fffb
    .4byte 0x10008000
    .4byte 0xffd5009d
    .4byte 0x00000005
    .4byte 0x10000000
    .4byte 0xffd500bf
    .4byte 0x0000fffd
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x90004000
    .4byte 0x00240055
    .4byte 0x0000ffee
    .4byte 0x10008000
    .4byte 0x001c0059
    .4byte 0x0000ffee
    .4byte 0x90004000
    .4byte 0xffbc005a
    .4byte 0x00000005
    .4byte 0x50004000
    .4byte 0xfffc0051
    .4byte 0x0000ffee
    .4byte 0x50004000
    .4byte 0xfffc0071
    .4byte 0x00000006
    .4byte 0x50000000
    .4byte 0x000c0000
    .4byte 0x0000fff6
    .4byte 0x50000000
    .4byte 0xfffc0000
    .4byte 0x0000fff6
    .4byte 0x50004000
    .4byte 0x00240080
    .4byte 0x0000fffe
    .4byte 0x10000000
    .4byte 0x001c0084
    .4byte 0x0000fffe
    .4byte 0x60004000
    .4byte 0xffdc0051
    .4byte 0x0000000a
    .4byte 0x60004000
    .4byte 0xffdc0071
    .4byte 0x0000fff2
    .4byte 0x60000000
    .4byte 0xffdc0000
    .4byte 0x0000fffa
    .4byte 0x60000000
    .4byte 0xffec0000
    .4byte 0x0000fffa
    .4byte 0x50000000
    .4byte 0xffcc0085
    .4byte 0x0000fff5
    .4byte 0x10000000
    .4byte 0xffc400a1
    .4byte 0x0000fffd
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_085D1470 + 0xe01
    .4byte gUnknown_085D1470 + 0xe25
    .4byte gUnknown_085D1470 + 0xe79
    .4byte gUnknown_085D1470 + 0xefd
    .4byte gUnknown_085D1470 + 0xf99
    .4byte gUnknown_085D1470 + 0x104d
    .4byte gUnknown_085D1470 + 0x1125
    .4byte 0x80000000
    .4byte gUnknown_085D1470 + 0x122d
    .4byte gUnknown_085D1470 + 0x1251
    .4byte gUnknown_085D1470 + 0x1281
    .4byte gUnknown_085D1470 + 0x12ed
    .4byte gUnknown_085D1470 + 0x1359
    .4byte gUnknown_085D1470 + 0x1425
    .4byte gUnknown_085D1470 + 0x14e5
    .4byte gUnknown_085D1470 + 0x158d
    .4byte 0x80000000
    .4byte gUnknown_085D1470 + 0x122d
    .4byte gUnknown_085D1470 + 0x164d
    .4byte gUnknown_085D1470 + 0x167d
    .4byte gUnknown_085D1470 + 0x16e9
    .4byte gUnknown_085D1470 + 0x1755
    .4byte gUnknown_085D1470 + 0x1821
    .4byte gUnknown_085D1470 + 0x18e1
    .4byte gUnknown_085D1470 + 0x1989
    .4byte 0x80000000
    .4byte gUnknown_085D1470 + 0x1125
    .4byte gUnknown_085D1470 + 0x104d
    .4byte gUnknown_085D1470 + 0xf99
    .4byte gUnknown_085D1470 + 0xefd
    .4byte gUnknown_085D1470 + 0xe79
    .4byte gUnknown_085D1470 + 0xe25
    .4byte gUnknown_085D1470 + 0xe01
    .4byte 0x80000000
    .4byte gUnknown_085D1470 + 0x158d
    .4byte gUnknown_085D1470 + 0x14e5
    .4byte gUnknown_085D1470 + 0x1425
    .4byte gUnknown_085D1470 + 0x1359
    .4byte gUnknown_085D1470 + 0x12ed
    .4byte gUnknown_085D1470 + 0x1281
    .4byte gUnknown_085D1470 + 0x1251
    .4byte gUnknown_085D1470 + 0x122d
    .4byte 0x80000000
    .4byte gUnknown_085D1470 + 0x1989
    .4byte gUnknown_085D1470 + 0x18e1
    .4byte gUnknown_085D1470 + 0x1821
    .4byte gUnknown_085D1470 + 0x1755
    .4byte gUnknown_085D1470 + 0x16e9
    .4byte gUnknown_085D1470 + 0x167d
    .4byte gUnknown_085D1470 + 0x164d
    .4byte gUnknown_085D1470 + 0x122d
    .4byte 0x80000000
    .4byte 0x40000000
    .4byte 0xfff80000
    .4byte 0x0000fff8
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff50000
    .4byte 0x0000fff7
    .4byte 0x00008000
    .4byte 0xffed0002
    .4byte 0x0000fff7
    .4byte 0x00004000
    .4byte 0xffed0003
    .4byte 0x00000007
    .4byte 0x00008000
    .4byte 0x00050000
    .4byte 0x0000fff7
    .4byte 0x00004000
    .4byte 0xfffd0004
    .4byte 0x00000007
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0x0017000b
    .4byte 0x0000fff7
    .4byte 0x10008000
    .4byte 0x000f000d
    .4byte 0x0000fff7
    .4byte 0x10004000
    .4byte 0x0017000e
    .4byte 0x00000007
    .4byte 0x10000000
    .4byte 0x000f0010
    .4byte 0x00000007
    .4byte 0x50000000
    .4byte 0xffff0000
    .4byte 0x0000fff7
    .4byte 0x50000000
    .4byte 0xffe70011
    .4byte 0x0000fff7
    .4byte 0x10008000
    .4byte 0xfff70000
    .4byte 0x0000fff7
    .4byte 0x10004000
    .4byte 0xffff000f
    .4byte 0x00000007
    .4byte 0x10000000
    .4byte 0xfff70010
    .4byte 0x00000007
    .4byte 0x10000000
    .4byte 0xffef002e
    .4byte 0x00000007
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0x00040000
    .4byte 0x0000fff6
    .4byte 0x50000000
    .4byte 0xffef0000
    .4byte 0x0000fff6
    .4byte 0x50000000
    .4byte 0x001c0006
    .4byte 0x0000fff6
    .4byte 0x10008000
    .4byte 0x00140008
    .4byte 0x0000fff6
    .4byte 0x10008000
    .4byte 0xffe70009
    .4byte 0x0000fff6
    .4byte 0x10004000
    .4byte 0x001c0023
    .4byte 0x00000006
    .4byte 0x10000000
    .4byte 0x00140025
    .4byte 0x00000006
    .4byte 0x10004000
    .4byte 0x00040024
    .4byte 0x00000006
    .4byte 0x10004000
    .4byte 0xffef0024
    .4byte 0x00000006
    .4byte 0x10000000
    .4byte 0xffe7000a
    .4byte 0x00000006
    .4byte 0x00008000
    .4byte 0xfffd0000
    .4byte 0x0000fff6
    .4byte 0x00000000
    .4byte 0xfffd0020
    .4byte 0x00000001
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0x00120013
    .4byte 0x0000fff6
    .4byte 0x10004000
    .4byte 0x00220036
    .4byte 0x0000fffe
    .4byte 0x10004000
    .4byte 0x00220015
    .4byte 0x00000006
    .4byte 0x10000000
    .4byte 0x001a0017
    .4byte 0x00000006
    .4byte 0x50000000
    .4byte 0x00020000
    .4byte 0x0000fff6
    .4byte 0x50000000
    .4byte 0xfff20000
    .4byte 0x0000fff6
    .4byte 0x10008000
    .4byte 0xffe20018
    .4byte 0x0000fff6
    .4byte 0x10004000
    .4byte 0x000a0016
    .4byte 0x00000006
    .4byte 0x10004000
    .4byte 0xfffa0016
    .4byte 0x00000006
    .4byte 0x10000000
    .4byte 0xffe20035
    .4byte 0x00000006
    .4byte 0x10004000
    .4byte 0xffea0016
    .4byte 0x00000006
    .4byte 0x10008000
    .4byte 0xffea0001
    .4byte 0x0000fff6
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0x00180042
    .4byte 0x0000fff4
    .4byte 0x50000000
    .4byte 0x00280040
    .4byte 0x0000fffc
    .4byte 0x10004000
    .4byte 0x00180044
    .4byte 0x00000004
    .4byte 0x10004000
    .4byte 0x00080044
    .4byte 0x00000004
    .4byte 0x50000000
    .4byte 0x00080000
    .4byte 0x0000fff4
    .4byte 0x50000000
    .4byte 0xfff80000
    .4byte 0x0000fff4
    .4byte 0x50000000
    .4byte 0xffe80000
    .4byte 0x0000fff4
    .4byte 0x10004000
    .4byte 0xfff80044
    .4byte 0x00000004
    .4byte 0x10004000
    .4byte 0xffe80044
    .4byte 0x00000004
    .4byte 0x10008000
    .4byte 0xffd80046
    .4byte 0x0000fff4
    .4byte 0x10008000
    .4byte 0xffe00000
    .4byte 0x0000fff4
    .4byte 0x10000000
    .4byte 0xffe00064
    .4byte 0x00000004
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0x00270019
    .4byte 0x0000fffe
    .4byte 0x50000000
    .4byte 0x0017001b
    .4byte 0x0000fff6
    .4byte 0x50000000
    .4byte 0x00070000
    .4byte 0x0000fff6
    .4byte 0x50000000
    .4byte 0xfff70000
    .4byte 0x0000fff6
    .4byte 0x10004000
    .4byte 0x0017002f
    .4byte 0x00000006
    .4byte 0x10004000
    .4byte 0x0007002f
    .4byte 0x00000006
    .4byte 0x10004000
    .4byte 0xfff7002f
    .4byte 0x00000006
    .4byte 0x50000000
    .4byte 0xffd7001d
    .4byte 0x0000fff6
    .4byte 0x10000000
    .4byte 0xffdf003f
    .4byte 0x00000006
    .4byte 0x50000000
    .4byte 0xffe70000
    .4byte 0x0000fff6
    .4byte 0x10004000
    .4byte 0xffe7002f
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0xffdc0047
    .4byte 0x0000ffee
    .4byte 0x00004000
    .4byte 0xffec0047
    .4byte 0x0000ffee
    .4byte 0x00004000
    .4byte 0xfffc0047
    .4byte 0x0000ffee
    .4byte 0x00000000
    .4byte 0x000c0047
    .4byte 0x0000ffee
    .4byte 0x00000000
    .4byte 0x000f0048
    .4byte 0x0000ffee
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0xfffb0000
    .4byte 0x0000fff7
    .4byte 0x10008000
    .4byte 0x000b0002
    .4byte 0x0000fff7
    .4byte 0x10004000
    .4byte 0x00030003
    .4byte 0x00000007
    .4byte 0x10008000
    .4byte 0xfff30000
    .4byte 0x0000fff7
    .4byte 0x10004000
    .4byte 0xfff30004
    .4byte 0x00000007
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xffd9000b
    .4byte 0x0000fff7
    .4byte 0x00008000
    .4byte 0xffe9000d
    .4byte 0x0000fff7
    .4byte 0x00004000
    .4byte 0xffd9000e
    .4byte 0x00000007
    .4byte 0x00000000
    .4byte 0xffe90010
    .4byte 0x00000007
    .4byte 0x40000000
    .4byte 0xfff10000
    .4byte 0x0000fff7
    .4byte 0x40000000
    .4byte 0x00090011
    .4byte 0x0000fff7
    .4byte 0x00008000
    .4byte 0x00010000
    .4byte 0x0000fff7
    .4byte 0x00004000
    .4byte 0xfff1000f
    .4byte 0x00000007
    .4byte 0x00000000
    .4byte 0x00010010
    .4byte 0x00000007
    .4byte 0x00000000
    .4byte 0x0009002e
    .4byte 0x00000007
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xffef0000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0xffff0000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0xffd70006
    .4byte 0x0000fff6
    .4byte 0x00008000
    .4byte 0xffe70008
    .4byte 0x0000fff6
    .4byte 0x00008000
    .4byte 0x000f0009
    .4byte 0x0000fff6
    .4byte 0x00004000
    .4byte 0xffd70023
    .4byte 0x00000006
    .4byte 0x00000000
    .4byte 0xffe70025
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0xffef0024
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0xffff0024
    .4byte 0x00000006
    .4byte 0x00000000
    .4byte 0x000f000a
    .4byte 0x00000006
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xffde0013
    .4byte 0x0000fff6
    .4byte 0x00004000
    .4byte 0xffce0036
    .4byte 0x0000fffe
    .4byte 0x00004000
    .4byte 0xffce0015
    .4byte 0x00000006
    .4byte 0x00000000
    .4byte 0xffde0017
    .4byte 0x00000006
    .4byte 0x40000000
    .4byte 0xffee0000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0xfffe0000
    .4byte 0x0000fff6
    .4byte 0x00008000
    .4byte 0x00160018
    .4byte 0x0000fff6
    .4byte 0x00004000
    .4byte 0xffe60016
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0xfff60016
    .4byte 0x00000006
    .4byte 0x00000000
    .4byte 0x00160035
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0x00060016
    .4byte 0x00000006
    .4byte 0x00008000
    .4byte 0x000e0001
    .4byte 0x0000fff6
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xffd80042
    .4byte 0x0000fff4
    .4byte 0x40000000
    .4byte 0xffc80040
    .4byte 0x0000fffc
    .4byte 0x00004000
    .4byte 0xffd80044
    .4byte 0x00000004
    .4byte 0x00004000
    .4byte 0xffe80044
    .4byte 0x00000004
    .4byte 0x40000000
    .4byte 0xffe80000
    .4byte 0x0000fff4
    .4byte 0x40000000
    .4byte 0xfff80000
    .4byte 0x0000fff4
    .4byte 0x40000000
    .4byte 0x00080000
    .4byte 0x0000fff4
    .4byte 0x00004000
    .4byte 0xfff80044
    .4byte 0x00000004
    .4byte 0x00004000
    .4byte 0x00080044
    .4byte 0x00000004
    .4byte 0x00008000
    .4byte 0x00200046
    .4byte 0x0000fff4
    .4byte 0x00008000
    .4byte 0x00180000
    .4byte 0x0000fff4
    .4byte 0x00000000
    .4byte 0x00180064
    .4byte 0x00000004
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xffc90019
    .4byte 0x0000fffe
    .4byte 0x40000000
    .4byte 0xffd9001b
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0xffe90000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0xfff90000
    .4byte 0x0000fff6
    .4byte 0x00004000
    .4byte 0xffd9002f
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0xffe9002f
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0xfff9002f
    .4byte 0x00000006
    .4byte 0x40000000
    .4byte 0x0019001d
    .4byte 0x0000fff6
    .4byte 0x00000000
    .4byte 0x0019003f
    .4byte 0x00000006
    .4byte 0x40000000
    .4byte 0x00090000
    .4byte 0x0000fff6
    .4byte 0x00004000
    .4byte 0x0009002f
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0x00140047
    .4byte 0x0000ffee
    .4byte 0x00004000
    .4byte 0x00040047
    .4byte 0x0000ffee
    .4byte 0x00004000
    .4byte 0xfff40047
    .4byte 0x0000ffee
    .4byte 0x00000000
    .4byte 0xffec0048
    .4byte 0x0000ffee
    .4byte 0x00000000
    .4byte 0xffe90047
    .4byte 0x0000ffee
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff20000
    .4byte 0x0000fff7
    .4byte 0x00008000
    .4byte 0xffea0002
    .4byte 0x0000fff7
    .4byte 0x00004000
    .4byte 0xffea0003
    .4byte 0x00000007
    .4byte 0x00008000
    .4byte 0x00020000
    .4byte 0x0000fff7
    .4byte 0x00004000
    .4byte 0xfffa0004
    .4byte 0x00000007
    .4byte 0x00008000
    .4byte 0xffe80049
    .4byte 0x0000fff7
    .4byte 0x20008000
    .4byte 0x000e0046
    .4byte 0x0000fff9
    .4byte 0x00000000
    .4byte 0x000a002a
    .4byte 0x0000fff9
    .4byte 0x00000000
    .4byte 0x000a002a
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x000a0067
    .4byte 0x0000fff1
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0xfffc0000
    .4byte 0x0000fff7
    .4byte 0x10008000
    .4byte 0x000c0002
    .4byte 0x0000fff7
    .4byte 0x10004000
    .4byte 0x00040003
    .4byte 0x00000007
    .4byte 0x10008000
    .4byte 0xfff40000
    .4byte 0x0000fff7
    .4byte 0x10004000
    .4byte 0xfff40004
    .4byte 0x00000007
    .4byte 0x10008000
    .4byte 0x000e0049
    .4byte 0x0000fff7
    .4byte 0x30008000
    .4byte 0xffe80046
    .4byte 0x0000fff9
    .4byte 0x10000000
    .4byte 0xffec002a
    .4byte 0x0000fff9
    .4byte 0x10000000
    .4byte 0xffec002a
    .4byte 0x00000001
    .4byte 0x10000000
    .4byte 0xffec0067
    .4byte 0x0000fff1
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_085D1470 + 0x1b1a
    .4byte gUnknown_085D1470 + 0x1b32
    .4byte gUnknown_085D1470 + 0x21f2
    .4byte gUnknown_085D1470 + 0x1b79
    .4byte gUnknown_085D1470 + 0x1bfd
    .4byte gUnknown_085D1470 + 0x1c99
    .4byte gUnknown_085D1470 + 0x1dd1
    .4byte gUnknown_085D1470 + 0x1d35
    .4byte 0x80000000
    .4byte gUnknown_085D1470 + 0x1b1a
    .4byte gUnknown_085D1470 + 0x1e9e
    .4byte gUnknown_085D1470 + 0x2276
    .4byte gUnknown_085D1470 + 0x1ee5
    .4byte gUnknown_085D1470 + 0x1f69
    .4byte gUnknown_085D1470 + 0x1fed
    .4byte gUnknown_085D1470 + 0x2125
    .4byte gUnknown_085D1470 + 0x2089
    .4byte 0x80000000
    .4byte gUnknown_085D1470 + 0x1d35
    .4byte gUnknown_085D1470 + 0x1dd1
    .4byte gUnknown_085D1470 + 0x1c99
    .4byte gUnknown_085D1470 + 0x1bfd
    .4byte gUnknown_085D1470 + 0x1b79
    .4byte gUnknown_085D1470 + 0x21f2
    .4byte gUnknown_085D1470 + 0x1b32
    .4byte gUnknown_085D1470 + 0x1b1a
    .4byte 0x80000000
    .4byte gUnknown_085D1470 + 0x2089
    .4byte gUnknown_085D1470 + 0x2125
    .4byte gUnknown_085D1470 + 0x1fed
    .4byte gUnknown_085D1470 + 0x1f69
    .4byte gUnknown_085D1470 + 0x1ee5
    .4byte gUnknown_085D1470 + 0x2276
    .4byte gUnknown_085D1470 + 0x1e9e
    .4byte gUnknown_085D1470 + 0x1b1a
    .4byte 0x80000000
    .4byte 0x40000000
    .4byte 0xfff80000
    .4byte 0x0000fff8
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff90000
    .4byte 0x0000fff4
    .4byte 0x00004000
    .4byte 0xfff90000
    .4byte 0x00000004
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff70008
    .4byte 0x0000ffec
    .4byte 0x40000000
    .4byte 0xfff9000a
    .4byte 0x0000fffc
    .4byte 0x00008000
    .4byte 0xffff000c
    .4byte 0x0000000c
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff00015
    .4byte 0x0000ffeb
    .4byte 0x00008000
    .4byte 0x00000017
    .4byte 0x0000ffeb
    .4byte 0x80004000
    .4byte 0xfff10019
    .4byte 0x0000fffb
    .4byte 0x40000000
    .4byte 0x0000001d
    .4byte 0x0000000b
    .4byte 0x00000000
    .4byte 0xfff80034
    .4byte 0x0000000b
    .4byte 0x00000000
    .4byte 0x00020038
    .4byte 0x0000001b
    .4byte 0x20000000
    .4byte 0xfff5003f
    .4byte 0x0000ffe8
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000d0068
    .4byte 0x0000fffd
    .4byte 0x40000000
    .4byte 0xffed0049
    .4byte 0x0000ffe5
    .4byte 0x80004000
    .4byte 0xffed0044
    .4byte 0x0000fff5
    .4byte 0x00000000
    .4byte 0xfffd0047
    .4byte 0x0000ffed
    .4byte 0x00000000
    .4byte 0xffe5004b
    .4byte 0x0000fff5
    .4byte 0x00000000
    .4byte 0xffe50048
    .4byte 0x0000ffed
    .4byte 0x00008000
    .4byte 0x000d004d
    .4byte 0x00000005
    .4byte 0x00008000
    .4byte 0x000d004e
    .4byte 0x00000015
    .4byte 0x40000000
    .4byte 0xfff50043
    .4byte 0x00000005
    .4byte 0x00008000
    .4byte 0x00050045
    .4byte 0x00000005
    .4byte 0x00000000
    .4byte 0x00050043
    .4byte 0x00000015
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00004000
    .4byte 0x0008005e
    .4byte 0x0000fff5
    .4byte 0x00004000
    .4byte 0x0008007e
    .4byte 0x0000000d
    .4byte 0x00004000
    .4byte 0xffe80059
    .4byte 0x0000ffec
    .4byte 0x00004000
    .4byte 0xffe80079
    .4byte 0x00000004
    .4byte 0x00004000
    .4byte 0xfff8005b
    .4byte 0x0000fff0
    .4byte 0x00004000
    .4byte 0xfff8007b
    .4byte 0x00000008
    .4byte 0x40000000
    .4byte 0xffe80000
    .4byte 0x0000fff4
    .4byte 0x40000000
    .4byte 0xfff80000
    .4byte 0x0000fff8
    .4byte 0x40000000
    .4byte 0x00080000
    .4byte 0x0000fffd
    .4byte 0x40000000
    .4byte 0x00180080
    .4byte 0x00000004
    .4byte 0x00000000
    .4byte 0x002800a2
    .4byte 0x0000000c
    .4byte 0x00000000
    .4byte 0x00180082
    .4byte 0x0000fffc
    .4byte 0x00008000
    .4byte 0xffe00058
    .4byte 0x0000ffec
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00004000
    .4byte 0xffe80091
    .4byte 0x0000fff1
    .4byte 0x00004000
    .4byte 0xfff80093
    .4byte 0x0000fff1
    .4byte 0x00004000
    .4byte 0x00080095
    .4byte 0x0000fff1
    .4byte 0x00004000
    .4byte 0xffe800b1
    .4byte 0x00000009
    .4byte 0x00004000
    .4byte 0xfff800b3
    .4byte 0x00000009
    .4byte 0x00004000
    .4byte 0x000800b5
    .4byte 0x00000009
    .4byte 0x40000000
    .4byte 0xffe80000
    .4byte 0x0000fff9
    .4byte 0x40000000
    .4byte 0xfff80000
    .4byte 0x0000fff9
    .4byte 0x40000000
    .4byte 0x00080000
    .4byte 0x0000fff9
    .4byte 0x40000000
    .4byte 0x00180097
    .4byte 0x0000fff9
    .4byte 0x00000000
    .4byte 0x002800b9
    .4byte 0x00000001
    .4byte 0x00004000
    .4byte 0x0018009a
    .4byte 0x00000009
    .4byte 0x00004000
    .4byte 0x002800ba
    .4byte 0x00000009
    .4byte 0x00008000
    .4byte 0xffe00090
    .4byte 0x0000fff9
    .4byte 0x00000000
    .4byte 0xffe00099
    .4byte 0x0000fff1
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0xfff90000
    .4byte 0x0000fffc
    .4byte 0x10004000
    .4byte 0xfff90000
    .4byte 0x0000fff4
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0xfffb0004
    .4byte 0x0000fff4
    .4byte 0x50000000
    .4byte 0xfff60006
    .4byte 0x00000004
    .4byte 0x10004000
    .4byte 0xfffc0022
    .4byte 0x0000ffec
    .4byte 0x20000000
    .4byte 0xfff80004
    .4byte 0x0000ffff
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0x0005000d
    .4byte 0x0000ffeb
    .4byte 0x10008000
    .4byte 0xfffd000f
    .4byte 0x0000ffeb
    .4byte 0x50000000
    .4byte 0xfffd0010
    .4byte 0x0000fffb
    .4byte 0x10008000
    .4byte 0xfff50012
    .4byte 0x0000fffb
    .4byte 0x10004000
    .4byte 0xfff50013
    .4byte 0x0000000b
    .4byte 0x10000000
    .4byte 0xffed0033
    .4byte 0x0000000b
    .4byte 0x10000000
    .4byte 0xfffb00ae
    .4byte 0x00000013
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x90004000
    .4byte 0x00000043
    .4byte 0x0000fff0
    .4byte 0x10008000
    .4byte 0xfff80047
    .4byte 0x0000fff0
    .4byte 0x10000000
    .4byte 0xfff00068
    .4byte 0x0000fff8
    .4byte 0x90004000
    .4byte 0xfff00043
    .4byte 0x00000000
    .4byte 0x10008000
    .4byte 0xffe80047
    .4byte 0x00000000
    .4byte 0x10000000
    .4byte 0xffe00068
    .4byte 0x00000008
    .4byte 0x10004000
    .4byte 0xffe80060
    .4byte 0x00000010
    .4byte 0x10000000
    .4byte 0xffe00062
    .4byte 0x00000010
    .4byte 0x10000000
    .4byte 0xfff80064
    .4byte 0x00000010
    .4byte 0x10000000
    .4byte 0x0018001f
    .4byte 0x0000ffe8
    .4byte 0x10004000
    .4byte 0x00080040
    .4byte 0x0000ffe8
    .4byte 0x10000000
    .4byte 0x00000042
    .4byte 0x0000ffe8
    .4byte 0x10000000
    .4byte 0x00200018
    .4byte 0x0000ffe8
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x10004000
    .4byte 0x00090051
    .4byte 0x0000ffee
    .4byte 0x10004000
    .4byte 0x00090071
    .4byte 0x00000006
    .4byte 0x50000000
    .4byte 0x00090000
    .4byte 0x0000fff6
    .4byte 0x50000000
    .4byte 0xfff90000
    .4byte 0x0000fff9
    .4byte 0x50000000
    .4byte 0xffe90000
    .4byte 0x0000fffb
    .4byte 0x10004000
    .4byte 0xfff90053
    .4byte 0x0000fff1
    .4byte 0x10004000
    .4byte 0xfff90073
    .4byte 0x00000009
    .4byte 0x10004000
    .4byte 0xffe90055
    .4byte 0x0000fff3
    .4byte 0x10004000
    .4byte 0xffe90075
    .4byte 0x0000000b
    .4byte 0x10008000
    .4byte 0xffe10057
    .4byte 0x0000fff9
    .4byte 0x10000000
    .4byte 0xffe1005d
    .4byte 0x00000009
    .4byte 0x50000000
    .4byte 0x0019004f
    .4byte 0x0000fff9
    .4byte 0x10000000
    .4byte 0x0029006b
    .4byte 0x0000fffb
    .4byte 0x10000000
    .4byte 0x0019007d
    .4byte 0x0000fff1
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x10004000
    .4byte 0x000c0086
    .4byte 0x0000fff2
    .4byte 0x10004000
    .4byte 0xfffc0088
    .4byte 0x0000fff2
    .4byte 0x10004000
    .4byte 0xffec008a
    .4byte 0x0000fff2
    .4byte 0x10004000
    .4byte 0x000c00a6
    .4byte 0x0000000a
    .4byte 0x10004000
    .4byte 0xfffc00a8
    .4byte 0x0000000a
    .4byte 0x10004000
    .4byte 0xffec00aa
    .4byte 0x0000000a
    .4byte 0x10008000
    .4byte 0xffe4008c
    .4byte 0x0000fffa
    .4byte 0x10000000
    .4byte 0xffdc00ad
    .4byte 0x0000fffa
    .4byte 0x50000000
    .4byte 0x000c0000
    .4byte 0x0000fffa
    .4byte 0x50000000
    .4byte 0xfffc0000
    .4byte 0x0000fffa
    .4byte 0x50000000
    .4byte 0xffec0000
    .4byte 0x0000fffa
    .4byte 0x50000000
    .4byte 0x00240083
    .4byte 0x0000fffa
    .4byte 0x10008000
    .4byte 0x001c0085
    .4byte 0x0000fffa
    .4byte 0x10004000
    .4byte 0xffdc008e
    .4byte 0x0000fff2
    .4byte 0x10000000
    .4byte 0x001c00ae
    .4byte 0x0000000a
    .4byte 0x10000000
    .4byte 0xffe400af
    .4byte 0x0000000a
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff70000
    .4byte 0x0000fffb
    .4byte 0x00004000
    .4byte 0xfff70000
    .4byte 0x0000fff3
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff60004
    .4byte 0x0000fff4
    .4byte 0x40000000
    .4byte 0xfffb0006
    .4byte 0x00000004
    .4byte 0x00004000
    .4byte 0xfff50022
    .4byte 0x0000ffec
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xffed000d
    .4byte 0x0000ffeb
    .4byte 0x00008000
    .4byte 0xfffd000f
    .4byte 0x0000ffeb
    .4byte 0x40000000
    .4byte 0xfff50010
    .4byte 0x0000fffb
    .4byte 0x00008000
    .4byte 0x00050012
    .4byte 0x0000fffb
    .4byte 0x00004000
    .4byte 0xfffd0013
    .4byte 0x0000000b
    .4byte 0x00000000
    .4byte 0x000d0033
    .4byte 0x0000000b
    .4byte 0x00000000
    .4byte 0xffff00ae
    .4byte 0x00000013
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x80004000
    .4byte 0xffe00043
    .4byte 0x0000ffef
    .4byte 0x00008000
    .4byte 0x00000047
    .4byte 0x0000ffef
    .4byte 0x00000000
    .4byte 0x00080068
    .4byte 0x0000fff7
    .4byte 0x80004000
    .4byte 0xfff00043
    .4byte 0x0000ffff
    .4byte 0x00008000
    .4byte 0x00100047
    .4byte 0x0000ffff
    .4byte 0x00000000
    .4byte 0x00180068
    .4byte 0x00000007
    .4byte 0x00004000
    .4byte 0x00080060
    .4byte 0x0000000f
    .4byte 0x00000000
    .4byte 0x00180062
    .4byte 0x0000000f
    .4byte 0x00000000
    .4byte 0x00000064
    .4byte 0x0000000f
    .4byte 0x00000000
    .4byte 0xffe0001f
    .4byte 0x0000ffe7
    .4byte 0x00004000
    .4byte 0xffe80040
    .4byte 0x0000ffe7
    .4byte 0x00000000
    .4byte 0xfff80042
    .4byte 0x0000ffe7
    .4byte 0x00000000
    .4byte 0xffd80018
    .4byte 0x0000ffe7
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00004000
    .4byte 0xffeb0051
    .4byte 0x0000ffee
    .4byte 0x00004000
    .4byte 0xffeb0071
    .4byte 0x00000006
    .4byte 0x40000000
    .4byte 0xffeb0000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0xfffb0000
    .4byte 0x0000fff9
    .4byte 0x40000000
    .4byte 0x000b0000
    .4byte 0x0000fffb
    .4byte 0x00004000
    .4byte 0xfffb0053
    .4byte 0x0000fff1
    .4byte 0x00004000
    .4byte 0xfffb0073
    .4byte 0x00000009
    .4byte 0x00004000
    .4byte 0x000b0055
    .4byte 0x0000fff3
    .4byte 0x00004000
    .4byte 0x000b0075
    .4byte 0x0000000b
    .4byte 0x00008000
    .4byte 0x001b0057
    .4byte 0x0000fff9
    .4byte 0x00000000
    .4byte 0x001b005d
    .4byte 0x00000009
    .4byte 0x40000000
    .4byte 0xffdb004f
    .4byte 0x0000fff9
    .4byte 0x00000000
    .4byte 0xffd3006b
    .4byte 0x0000fffb
    .4byte 0x00000000
    .4byte 0xffe3007d
    .4byte 0x0000fff1
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00004000
    .4byte 0xffe80086
    .4byte 0x0000fff0
    .4byte 0x00004000
    .4byte 0xfff80088
    .4byte 0x0000fff0
    .4byte 0x00004000
    .4byte 0x0008008a
    .4byte 0x0000fff0
    .4byte 0x00004000
    .4byte 0xffe800a6
    .4byte 0x00000008
    .4byte 0x00004000
    .4byte 0xfff800a8
    .4byte 0x00000008
    .4byte 0x00004000
    .4byte 0x000800aa
    .4byte 0x00000008
    .4byte 0x00008000
    .4byte 0x0018008c
    .4byte 0x0000fff8
    .4byte 0x00000000
    .4byte 0x002000ad
    .4byte 0x0000fff8
    .4byte 0x40000000
    .4byte 0xffe80000
    .4byte 0x0000fff8
    .4byte 0x40000000
    .4byte 0xfff80000
    .4byte 0x0000fff8
    .4byte 0x40000000
    .4byte 0x00080000
    .4byte 0x0000fff8
    .4byte 0x40000000
    .4byte 0xffd00083
    .4byte 0x0000fff8
    .4byte 0x00008000
    .4byte 0xffe00085
    .4byte 0x0000fff8
    .4byte 0x00004000
    .4byte 0x0018008e
    .4byte 0x0000fff0
    .4byte 0x00000000
    .4byte 0xffe000ae
    .4byte 0x00000008
    .4byte 0x00000000
    .4byte 0x001800af
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0xfff70000
    .4byte 0x0000fff4
    .4byte 0x10004000
    .4byte 0xfff70000
    .4byte 0x00000004
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0xfffa0008
    .4byte 0x0000ffec
    .4byte 0x50000000
    .4byte 0xfff8000a
    .4byte 0x0000fffc
    .4byte 0x10008000
    .4byte 0xfffa000c
    .4byte 0x0000000c
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0x00010015
    .4byte 0x0000ffea
    .4byte 0x10008000
    .4byte 0xfff90017
    .4byte 0x0000ffea
    .4byte 0x90004000
    .4byte 0xfff00019
    .4byte 0x0000fffa
    .4byte 0x50000000
    .4byte 0xfff1001d
    .4byte 0x0000000a
    .4byte 0x10000000
    .4byte 0x00010034
    .4byte 0x0000000a
    .4byte 0x10000000
    .4byte 0xfff70038
    .4byte 0x0000001a
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x10000000
    .4byte 0xffec0068
    .4byte 0x0000fffc
    .4byte 0x50000000
    .4byte 0x00040049
    .4byte 0x0000ffe4
    .4byte 0x90004000
    .4byte 0xfff40044
    .4byte 0x0000fff4
    .4byte 0x10000000
    .4byte 0xfffc0047
    .4byte 0x0000ffec
    .4byte 0x10000000
    .4byte 0x0014004b
    .4byte 0x0000fff4
    .4byte 0x10000000
    .4byte 0x00140048
    .4byte 0x0000ffec
    .4byte 0x10008000
    .4byte 0xffec004d
    .4byte 0x00000004
    .4byte 0x10008000
    .4byte 0xffec004e
    .4byte 0x00000014
    .4byte 0x50000000
    .4byte 0xfffc0043
    .4byte 0x00000004
    .4byte 0x10008000
    .4byte 0xfff40045
    .4byte 0x00000004
    .4byte 0x10000000
    .4byte 0xfff40043
    .4byte 0x00000014
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x10004000
    .4byte 0xffeb005e
    .4byte 0x0000fff5
    .4byte 0x10004000
    .4byte 0xffeb007e
    .4byte 0x0000000d
    .4byte 0x10004000
    .4byte 0x000b0059
    .4byte 0x0000ffec
    .4byte 0x10004000
    .4byte 0x000b0079
    .4byte 0x00000004
    .4byte 0x10004000
    .4byte 0xfffb005b
    .4byte 0x0000fff0
    .4byte 0x10004000
    .4byte 0xfffb007b
    .4byte 0x00000008
    .4byte 0x50000000
    .4byte 0x000b0000
    .4byte 0x0000fff4
    .4byte 0x50000000
    .4byte 0xfffb0000
    .4byte 0x0000fff8
    .4byte 0x50000000
    .4byte 0xffeb0000
    .4byte 0x0000fffd
    .4byte 0x50000000
    .4byte 0xffdb0080
    .4byte 0x00000004
    .4byte 0x10000000
    .4byte 0xffd300a2
    .4byte 0x0000000c
    .4byte 0x10000000
    .4byte 0xffe30082
    .4byte 0x0000fffc
    .4byte 0x10008000
    .4byte 0x001b0058
    .4byte 0x0000ffec
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x10004000
    .4byte 0x000c0091
    .4byte 0x0000fff0
    .4byte 0x10004000
    .4byte 0xfffc0093
    .4byte 0x0000fff0
    .4byte 0x10004000
    .4byte 0xffec0095
    .4byte 0x0000fff0
    .4byte 0x10004000
    .4byte 0x000c00b1
    .4byte 0x00000008
    .4byte 0x10004000
    .4byte 0xfffc00b3
    .4byte 0x00000008
    .4byte 0x10004000
    .4byte 0xffec00b5
    .4byte 0x00000008
    .4byte 0x50000000
    .4byte 0x000c0000
    .4byte 0x0000fff8
    .4byte 0x50000000
    .4byte 0xfffc0000
    .4byte 0x0000fff8
    .4byte 0x50000000
    .4byte 0xffec0000
    .4byte 0x0000fff8
    .4byte 0x50000000
    .4byte 0xffdc0097
    .4byte 0x0000fff8
    .4byte 0x10000000
    .4byte 0xffd400b9
    .4byte 0x00000000
    .4byte 0x10004000
    .4byte 0xffdc009a
    .4byte 0x00000008
    .4byte 0x10004000
    .4byte 0xffcc00ba
    .4byte 0x00000008
    .4byte 0x10008000
    .4byte 0x001c0090
    .4byte 0x0000fff8
    .4byte 0x10000000
    .4byte 0x001c0099
    .4byte 0x0000fff0
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0xfff3009c
    .4byte 0x0000fff4
    .4byte 0x00000000
    .4byte 0xfff3009d
    .4byte 0x00000004
    .4byte 0x00000000
    .4byte 0xfffb0000
    .4byte 0x0000ffff
    .4byte 0x00000000
    .4byte 0xfffb0020
    .4byte 0x00000006
    .4byte 0x30008000
    .4byte 0x0007009c
    .4byte 0x0000fffe
    .4byte 0x30000000
    .4byte 0x0007009d
    .4byte 0x0000fff7
    .4byte 0x00008000
    .4byte 0xffff0000
    .4byte 0x0000fffe
    .4byte 0x10000000
    .4byte 0xffff005b
    .4byte 0x0000ffee
    .4byte 0x10000000
    .4byte 0xfff8005c
    .4byte 0x0000ffee
    .4byte 0x00008000
    .4byte 0xfffa0000
    .4byte 0x0000fff4
    .4byte 0x00008000
    .4byte 0xffff0001
    .4byte 0x0000fff4
    .4byte 0x00004000
    .4byte 0xfffb0060
    .4byte 0x0000000c
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x20008000
    .4byte 0xfff3009c
    .4byte 0x0000fffe
    .4byte 0x20000000
    .4byte 0xfff3009d
    .4byte 0x0000fff6
    .4byte 0x20000000
    .4byte 0xfffa0000
    .4byte 0x0000fffb
    .4byte 0x20000000
    .4byte 0xfffb0020
    .4byte 0x0000fff5
    .4byte 0x10008000
    .4byte 0x0005009c
    .4byte 0x0000fff4
    .4byte 0x10000000
    .4byte 0x0005009d
    .4byte 0x00000003
    .4byte 0x20008000
    .4byte 0xfffd0000
    .4byte 0x0000fff4
    .4byte 0x30000000
    .4byte 0xfffd005b
    .4byte 0x0000000c
    .4byte 0x30000000
    .4byte 0xfff7005c
    .4byte 0x0000000c
    .4byte 0x20008000
    .4byte 0xfff90000
    .4byte 0x0000fffe
    .4byte 0x20008000
    .4byte 0xfffd0001
    .4byte 0x0000fffe
    .4byte 0x10000000
    .4byte 0x0001005b
    .4byte 0x0000ffee
    .4byte 0x10000000
    .4byte 0xfffb005c
    .4byte 0x0000ffee
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x30008000
    .4byte 0x0005009c
    .4byte 0x0000fffe
    .4byte 0x30000000
    .4byte 0x0005009d
    .4byte 0x0000fff6
    .4byte 0x30000000
    .4byte 0xfffe0000
    .4byte 0x0000fffb
    .4byte 0x30000000
    .4byte 0xfffd0020
    .4byte 0x0000fff5
    .4byte 0x00008000
    .4byte 0xfff3009c
    .4byte 0x0000fff4
    .4byte 0x00000000
    .4byte 0xfff3009d
    .4byte 0x00000003
    .4byte 0x30008000
    .4byte 0xfffb0000
    .4byte 0x0000fff4
    .4byte 0x20000000
    .4byte 0xfffb005b
    .4byte 0x0000000c
    .4byte 0x20000000
    .4byte 0x0001005c
    .4byte 0x0000000c
    .4byte 0x30008000
    .4byte 0xffff0000
    .4byte 0x0000fffe
    .4byte 0x30008000
    .4byte 0xfffb0001
    .4byte 0x0000fffe
    .4byte 0x00000000
    .4byte 0xfff7005b
    .4byte 0x0000ffee
    .4byte 0x00000000
    .4byte 0xfffd005c
    .4byte 0x0000ffee
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x10008000
    .4byte 0x0006009c
    .4byte 0x0000fff3
    .4byte 0x10000000
    .4byte 0x0006009d
    .4byte 0x00000003
    .4byte 0x10000000
    .4byte 0xfffe0000
    .4byte 0x0000fffe
    .4byte 0x10000000
    .4byte 0xfffe0020
    .4byte 0x00000005
    .4byte 0x20008000
    .4byte 0xfff2009c
    .4byte 0x0000fffd
    .4byte 0x20000000
    .4byte 0xfff2009d
    .4byte 0x0000fff6
    .4byte 0x10008000
    .4byte 0xfffa0000
    .4byte 0x0000fffd
    .4byte 0x00000000
    .4byte 0xfffa005b
    .4byte 0x0000ffed
    .4byte 0x00000000
    .4byte 0x0001005c
    .4byte 0x0000ffed
    .4byte 0x10008000
    .4byte 0xffff0000
    .4byte 0x0000fff3
    .4byte 0x10008000
    .4byte 0xfffa0001
    .4byte 0x0000fff3
    .4byte 0x10004000
    .4byte 0xfff60060
    .4byte 0x0000000b
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_085D1470 + 0x238a
    .4byte gUnknown_085D1470 + 0x23a2
    .4byte gUnknown_085D1470 + 0x2eb2
    .4byte gUnknown_085D1470 + 0x23c5
    .4byte gUnknown_085D1470 + 0x23f5
    .4byte gUnknown_085D1470 + 0x2455
    .4byte gUnknown_085D1470 + 0x24e5
    .4byte gUnknown_085D1470 + 0x258d
    .4byte 0x80000000
    .4byte gUnknown_085D1470 + 0x238a
    .4byte gUnknown_085D1470 + 0x264e
    .4byte gUnknown_085D1470 + 0x2f4e
    .4byte gUnknown_085D1470 + 0x2671
    .4byte gUnknown_085D1470 + 0x26ad
    .4byte gUnknown_085D1470 + 0x270d
    .4byte gUnknown_085D1470 + 0x27b5
    .4byte gUnknown_085D1470 + 0x2869
    .4byte 0x80000000
    .4byte gUnknown_085D1470 + 0x238a
    .4byte gUnknown_085D1470 + 0x2936
    .4byte gUnknown_085D1470 + 0x2ff6
    .4byte gUnknown_085D1470 + 0x2959
    .4byte gUnknown_085D1470 + 0x2989
    .4byte gUnknown_085D1470 + 0x29e9
    .4byte gUnknown_085D1470 + 0x2a91
    .4byte gUnknown_085D1470 + 0x2b45
    .4byte 0x80000000
    .4byte gUnknown_085D1470 + 0x238a
    .4byte gUnknown_085D1470 + 0x2c12
    .4byte gUnknown_085D1470 + 0x309e
    .4byte gUnknown_085D1470 + 0x2c35
    .4byte gUnknown_085D1470 + 0x2c65
    .4byte gUnknown_085D1470 + 0x2cb9
    .4byte gUnknown_085D1470 + 0x2d49
    .4byte gUnknown_085D1470 + 0x2df1
    .4byte 0x80000000
    .4byte gUnknown_085D1470 + 0x258d
    .4byte gUnknown_085D1470 + 0x24e5
    .4byte gUnknown_085D1470 + 0x2455
    .4byte gUnknown_085D1470 + 0x23f5
    .4byte gUnknown_085D1470 + 0x23c5
    .4byte gUnknown_085D1470 + 0x2eb2
    .4byte gUnknown_085D1470 + 0x23a2
    .4byte gUnknown_085D1470 + 0x238a
    .4byte 0x80000000
    .4byte gUnknown_085D1470 + 0x2869
    .4byte gUnknown_085D1470 + 0x27b5
    .4byte gUnknown_085D1470 + 0x270d
    .4byte gUnknown_085D1470 + 0x26ad
    .4byte gUnknown_085D1470 + 0x2671
    .4byte gUnknown_085D1470 + 0x2f4e
    .4byte gUnknown_085D1470 + 0x264e
    .4byte gUnknown_085D1470 + 0x238a
    .4byte 0x80000000
    .4byte gUnknown_085D1470 + 0x2b45
    .4byte gUnknown_085D1470 + 0x2a91
    .4byte gUnknown_085D1470 + 0x29e9
    .4byte gUnknown_085D1470 + 0x2989
    .4byte gUnknown_085D1470 + 0x2959
    .4byte gUnknown_085D1470 + 0x2ff6
    .4byte gUnknown_085D1470 + 0x2936
    .4byte gUnknown_085D1470 + 0x238a
    .4byte 0x80000000
    .4byte gUnknown_085D1470 + 0x2df1
    .4byte gUnknown_085D1470 + 0x2d49
    .4byte gUnknown_085D1470 + 0x2cb9
    .4byte gUnknown_085D1470 + 0x2c65
    .4byte gUnknown_085D1470 + 0x2c35
    .4byte gUnknown_085D1470 + 0x309e
    .4byte gUnknown_085D1470 + 0x2c12
    .4byte gUnknown_085D1470 + 0x238a
    .4byte 0x80000000
    .4byte 0x40000000
    .4byte 0xfff80000
    .4byte 0x0000fff8
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x70000000
    .4byte 0x00000002
    .4byte 0x00000000
    .4byte 0x70000000
    .4byte 0xfff00004
    .4byte 0x0000fff0
    .4byte 0x70000000
    .4byte 0x00000006
    .4byte 0x0000fff0
    .4byte 0x70000000
    .4byte 0xfff00008
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff80000
    .4byte 0x00000004
    .4byte 0x40000000
    .4byte 0xfff80000
    .4byte 0x0000fff4
    .4byte 0x00008000
    .4byte 0x0008000a
    .4byte 0x0000fff4
    .4byte 0x00008000
    .4byte 0x0008000a
    .4byte 0x00000004
    .4byte 0x10008000
    .4byte 0xfff0000a
    .4byte 0x0000fff4
    .4byte 0x10008000
    .4byte 0xfff0000a
    .4byte 0x00000004
    .4byte 0x00004000
    .4byte 0xfff80000
    .4byte 0x0000ffec
    .4byte 0x00000000
    .4byte 0x0008002a
    .4byte 0x0000ffec
    .4byte 0x10000000
    .4byte 0xfff0002a
    .4byte 0x0000ffec
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x90004000
    .4byte 0x00000043
    .4byte 0x0000fff0
    .4byte 0x10008000
    .4byte 0xfff80047
    .4byte 0x0000fff0
    .4byte 0x10000000
    .4byte 0xfff00068
    .4byte 0x0000fff8
    .4byte 0x90004000
    .4byte 0xfff00043
    .4byte 0x00000000
    .4byte 0x10008000
    .4byte 0xffe80047
    .4byte 0x00000000
    .4byte 0x10000000
    .4byte 0xffe00068
    .4byte 0x00000008
    .4byte 0x10004000
    .4byte 0xffe80060
    .4byte 0x00000010
    .4byte 0x10000000
    .4byte 0xffe00062
    .4byte 0x00000010
    .4byte 0x10000000
    .4byte 0xfff80064
    .4byte 0x00000010
    .4byte 0x10000000
    .4byte 0x0018001f
    .4byte 0x0000ffe8
    .4byte 0x10004000
    .4byte 0x00080040
    .4byte 0x0000ffe8
    .4byte 0x10000000
    .4byte 0x00000042
    .4byte 0x0000ffe8
    .4byte 0x10000000
    .4byte 0x00200018
    .4byte 0x0000ffe8
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x10004000
    .4byte 0x00080051
    .4byte 0x0000ffee
    .4byte 0x10004000
    .4byte 0x00080071
    .4byte 0x00000006
    .4byte 0x50000000
    .4byte 0x00080000
    .4byte 0x0000fff6
    .4byte 0x50000000
    .4byte 0xfff80000
    .4byte 0x0000fff9
    .4byte 0x50000000
    .4byte 0xffe80000
    .4byte 0x0000fffb
    .4byte 0x10004000
    .4byte 0xfff80053
    .4byte 0x0000fff1
    .4byte 0x10004000
    .4byte 0xfff80073
    .4byte 0x00000009
    .4byte 0x10004000
    .4byte 0xffe80055
    .4byte 0x0000fff3
    .4byte 0x10004000
    .4byte 0xffe80075
    .4byte 0x0000000b
    .4byte 0x10008000
    .4byte 0xffe00057
    .4byte 0x0000fff9
    .4byte 0x10000000
    .4byte 0xffe0005d
    .4byte 0x00000009
    .4byte 0x50000000
    .4byte 0x0018004f
    .4byte 0x0000fff9
    .4byte 0x10000000
    .4byte 0x0028006b
    .4byte 0x0000fffb
    .4byte 0x10000000
    .4byte 0x0018007d
    .4byte 0x0000fff1
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x10004000
    .4byte 0x000a0086
    .4byte 0x0000fff0
    .4byte 0x10004000
    .4byte 0xfffa0088
    .4byte 0x0000fff0
    .4byte 0x10004000
    .4byte 0xffea008a
    .4byte 0x0000fff0
    .4byte 0x10004000
    .4byte 0x000a00a6
    .4byte 0x00000008
    .4byte 0x10004000
    .4byte 0xfffa00a8
    .4byte 0x00000008
    .4byte 0x10004000
    .4byte 0xffea00aa
    .4byte 0x00000008
    .4byte 0x10008000
    .4byte 0xffe2008c
    .4byte 0x0000fff8
    .4byte 0x10000000
    .4byte 0xffda00ad
    .4byte 0x0000fff8
    .4byte 0x50000000
    .4byte 0x000a0000
    .4byte 0x0000fff8
    .4byte 0x50000000
    .4byte 0xfffa0000
    .4byte 0x0000fff8
    .4byte 0x50000000
    .4byte 0xffea0000
    .4byte 0x0000fff8
    .4byte 0x50000000
    .4byte 0x00220083
    .4byte 0x0000fff8
    .4byte 0x10008000
    .4byte 0x001a0085
    .4byte 0x0000fff8
    .4byte 0x10004000
    .4byte 0xffda008e
    .4byte 0x0000fff0
    .4byte 0x10000000
    .4byte 0x001a00ae
    .4byte 0x00000008
    .4byte 0x10000000
    .4byte 0xffe200af
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff00002
    .4byte 0x0000fff0
    .4byte 0x40000000
    .4byte 0x00000004
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff00006
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0x00000008
    .4byte 0x0000fff0
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff80000
    .4byte 0x00000004
    .4byte 0x40000000
    .4byte 0xfff80000
    .4byte 0x0000fff4
    .4byte 0x00008000
    .4byte 0x0008000a
    .4byte 0x0000fff4
    .4byte 0x00008000
    .4byte 0x0008000a
    .4byte 0x00000004
    .4byte 0x10008000
    .4byte 0xfff0000a
    .4byte 0x0000fff4
    .4byte 0x10008000
    .4byte 0xfff0000a
    .4byte 0x00000004
    .4byte 0x00004000
    .4byte 0xfff80000
    .4byte 0x0000ffec
    .4byte 0x00000000
    .4byte 0x0008002a
    .4byte 0x0000ffec
    .4byte 0x10000000
    .4byte 0xfff0002a
    .4byte 0x0000ffec
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x10000000
    .4byte 0xffec0068
    .4byte 0x0000fffc
    .4byte 0x50000000
    .4byte 0x00040049
    .4byte 0x0000ffe4
    .4byte 0x90004000
    .4byte 0xfff40044
    .4byte 0x0000fff4
    .4byte 0x10000000
    .4byte 0xfffc0047
    .4byte 0x0000ffec
    .4byte 0x10000000
    .4byte 0x0014004b
    .4byte 0x0000fff4
    .4byte 0x10000000
    .4byte 0x00140048
    .4byte 0x0000ffec
    .4byte 0x10008000
    .4byte 0xffec004d
    .4byte 0x00000004
    .4byte 0x10008000
    .4byte 0xffec004e
    .4byte 0x00000014
    .4byte 0x50000000
    .4byte 0xfffc0043
    .4byte 0x00000004
    .4byte 0x10008000
    .4byte 0xfff40045
    .4byte 0x00000004
    .4byte 0x10000000
    .4byte 0xfff40043
    .4byte 0x00000014
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x10004000
    .4byte 0xffec005e
    .4byte 0x0000fff5
    .4byte 0x10004000
    .4byte 0xffec007e
    .4byte 0x0000000d
    .4byte 0x10004000
    .4byte 0x000c0059
    .4byte 0x0000ffec
    .4byte 0x10004000
    .4byte 0x000c0079
    .4byte 0x00000004
    .4byte 0x10004000
    .4byte 0xfffc005b
    .4byte 0x0000fff0
    .4byte 0x10004000
    .4byte 0xfffc007b
    .4byte 0x00000008
    .4byte 0x50000000
    .4byte 0x000c0000
    .4byte 0x0000fff4
    .4byte 0x50000000
    .4byte 0xfffc0000
    .4byte 0x0000fff8
    .4byte 0x50000000
    .4byte 0xffec0000
    .4byte 0x0000fffd
    .4byte 0x50000000
    .4byte 0xffdc0080
    .4byte 0x00000004
    .4byte 0x10000000
    .4byte 0xffd400a2
    .4byte 0x0000000c
    .4byte 0x10000000
    .4byte 0xffe40082
    .4byte 0x0000fffc
    .4byte 0x10008000
    .4byte 0x001c0058
    .4byte 0x0000ffec
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x10004000
    .4byte 0x000c0091
    .4byte 0x0000fff0
    .4byte 0x10004000
    .4byte 0xfffc0093
    .4byte 0x0000fff0
    .4byte 0x10004000
    .4byte 0xffec0095
    .4byte 0x0000fff0
    .4byte 0x10004000
    .4byte 0x000c00b1
    .4byte 0x00000008
    .4byte 0x10004000
    .4byte 0xfffc00b3
    .4byte 0x00000008
    .4byte 0x10004000
    .4byte 0xffec00b5
    .4byte 0x00000008
    .4byte 0x50000000
    .4byte 0x000c0000
    .4byte 0x0000fff8
    .4byte 0x50000000
    .4byte 0xfffc0000
    .4byte 0x0000fff8
    .4byte 0x50000000
    .4byte 0xffec0000
    .4byte 0x0000fff8
    .4byte 0x50000000
    .4byte 0xffdc0097
    .4byte 0x0000fff8
    .4byte 0x10000000
    .4byte 0xffd400b9
    .4byte 0x00000000
    .4byte 0x10004000
    .4byte 0xffdc009a
    .4byte 0x00000008
    .4byte 0x10004000
    .4byte 0xffcc00ba
    .4byte 0x00000008
    .4byte 0x10008000
    .4byte 0x001c0090
    .4byte 0x0000fff8
    .4byte 0x10000000
    .4byte 0x001c0099
    .4byte 0x0000fff0
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff4000b
    .4byte 0x0000fff4
    .4byte 0x00008000
    .4byte 0x0004000d
    .4byte 0x0000fff4
    .4byte 0x00004000
    .4byte 0xfff4000e
    .4byte 0x00000004
    .4byte 0x00000000
    .4byte 0x00040010
    .4byte 0x00000004
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff90000
    .4byte 0x0000ffee
    .4byte 0x40000000
    .4byte 0xfff90000
    .4byte 0x0000fffe
    .4byte 0x00008000
    .4byte 0xfff1009c
    .4byte 0x0000fff2
    .4byte 0x00008000
    .4byte 0xfff1009d
    .4byte 0x00000002
    .4byte 0x00004000
    .4byte 0xfff90011
    .4byte 0x00000012
    .4byte 0x00000000
    .4byte 0xfff100bf
    .4byte 0x00000012
    .4byte 0x00004000
    .4byte 0xfff9009e
    .4byte 0x0000ffe6
    .4byte 0x00000000
    .4byte 0x000900be
    .4byte 0x0000ffe6
    .4byte 0x30008000
    .4byte 0x0009009d
    .4byte 0x0000ffee
    .4byte 0x30008000
    .4byte 0x0009009c
    .4byte 0x0000fffe
    .4byte 0x00004000
    .4byte 0xfff90000
    .4byte 0x0000000a
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff90000
    .4byte 0x0000ffee
    .4byte 0x40000000
    .4byte 0xfff90000
    .4byte 0x0000fffe
    .4byte 0x00008000
    .4byte 0xfff1009c
    .4byte 0x0000fff2
    .4byte 0x00008000
    .4byte 0xfff1009d
    .4byte 0x00000002
    .4byte 0x30004000
    .4byte 0xfff90011
    .4byte 0x0000ffe6
    .4byte 0x30000000
    .4byte 0x000900bf
    .4byte 0x0000ffe6
    .4byte 0x30008000
    .4byte 0x0009009d
    .4byte 0x0000ffee
    .4byte 0x30008000
    .4byte 0x0009009c
    .4byte 0x0000fffe
    .4byte 0x00004000
    .4byte 0xfff90000
    .4byte 0x0000000a
    .4byte 0x00004000
    .4byte 0xfff20013
    .4byte 0x00000012
    .4byte 0x00000000
    .4byte 0x00020015
    .4byte 0x00000012
    .4byte 0x00000000
    .4byte 0x00020016
    .4byte 0x0000001a
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_085D1470 + 0x325a
    .4byte gUnknown_085D1470 + 0x37fa
    .4byte gUnknown_085D1470 + 0x3272
    .4byte gUnknown_085D1470 + 0x32ad
    .4byte gUnknown_085D1470 + 0x3835
    .4byte gUnknown_085D1470 + 0x3325
    .4byte gUnknown_085D1470 + 0x33cd
    .4byte gUnknown_085D1470 + 0x3481
    .4byte 0x80000000
    .4byte gUnknown_085D1470 + 0x325a
    .4byte gUnknown_085D1470 + 0x37fa
    .4byte gUnknown_085D1470 + 0x354e
    .4byte gUnknown_085D1470 + 0x3589
    .4byte gUnknown_085D1470 + 0x38c5
    .4byte gUnknown_085D1470 + 0x3601
    .4byte gUnknown_085D1470 + 0x3691
    .4byte gUnknown_085D1470 + 0x3739
    .4byte 0x80000000
    .4byte gUnknown_085D1470 + 0x3481
    .4byte gUnknown_085D1470 + 0x33cd
    .4byte gUnknown_085D1470 + 0x3325
    .4byte gUnknown_085D1470 + 0x3835
    .4byte gUnknown_085D1470 + 0x32ad
    .4byte gUnknown_085D1470 + 0x3272
    .4byte gUnknown_085D1470 + 0x37fa
    .4byte gUnknown_085D1470 + 0x325a
    .4byte 0x80000000
    .4byte gUnknown_085D1470 + 0x3739
    .4byte gUnknown_085D1470 + 0x3691
    .4byte gUnknown_085D1470 + 0x3601
    .4byte gUnknown_085D1470 + 0x38c5
    .4byte gUnknown_085D1470 + 0x3589
    .4byte gUnknown_085D1470 + 0x354e
    .4byte gUnknown_085D1470 + 0x37fa
    .4byte gUnknown_085D1470 + 0x325a
    .4byte 0x80000000
