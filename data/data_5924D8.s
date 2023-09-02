    .section .data
	.global gUnknown_085924D8
gUnknown_085924D8:  @ 0x085924D8
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word nullsub_44
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8011784
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_085924f8
gUnknown_085924F8:  @ 0x085924F8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8011A48
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8011AA0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_08592510
gUnknown_08592510:  @ 0x08592510
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8011AF4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8011B4C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8011B90
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_08592530
gUnknown_08592530:  @ 0x08592530
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8011A48
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8011AA0
        @ PROC_SLEEP
        .short 0xe, 0x64
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8011AF4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8011B4C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8011B90
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08592568
gUnknown_08592568:  @ 0x08592568
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80126BC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08592580
gUnknown_08592580:  @ 0x08592580
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8012A2C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8012A64
        @ PROC_SLEEP
        .short 0xe, 0x50
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8012AC0
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
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


	.global ProcScr_BoomFogFx
ProcScr_BoomFogFx:  @ 0x085925D0
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807CE18
        @ PROC_WHILE
        .short 0x14, 0x0
        .word APProc_Exists
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085925F0
gUnknown_085925F0:  @ 0x085925F0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8012B9C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08592608
gUnknown_08592608:  @ 0x08592608
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8012CE4
        @ PROC_WHILE
        .short 0x14, 0x0
        .word sub_80AE750
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_08592628
gUnknown_08592628:  @ 0x08592628
@ Replacing .incbin "baserom.gba", 0x592628, 0xCC
    .4byte 0x3
    .4byte gUnknown_081C0AFC
    .4byte 0x1
    .4byte 0x1
    .4byte gUnknown_081C0AFC + 0x20
    .4byte 0x11000
    .4byte 0x2
    .4byte gUnknown_081C0AFC + 0xe04
    .4byte 0x10000
    .4byte 0x2
    .4byte gUnknown_081C0AFC + 0xe50
    .4byte 0x10000
    .4byte 0x2
    .4byte gUnknown_081C0AFC + 0xe9c
    .4byte 0x10000
    .4byte 0x2
    .4byte gUnknown_081C0AFC + 0xee8
    .4byte 0x20000
    .4byte 0x2
    .4byte gUnknown_081C0AFC + 0xf34
    .4byte 0x30000
    .4byte 0x2
    .4byte gUnknown_081C0AFC + 0xf80
    .4byte 0x30000
    .4byte 0x2
    .4byte gUnknown_081C0AFC + 0xfcc
    .4byte 0x40000
    .4byte 0x2
    .4byte gUnknown_081C0AFC + 0x1018
    .4byte 0x40000
    .4byte 0x2
    .4byte gUnknown_081C0AFC + 0x1064
    .4byte 0x40000
    .4byte 0x2
    .4byte gUnknown_081C0AFC + 0x10b0
    .4byte 0x40000
    .4byte 0x2
    .4byte gUnknown_081C0AFC + 0x10fc
    .4byte 0x40000
    .4byte 0x2
    .4byte gUnknown_081C0AFC + 0x1148
    .4byte 0x40000
    .4byte 0x2
    .4byte gUnknown_081C0AFC + 0x1194
    .4byte 0x20000
    .4byte 0x2
    .4byte gUnknown_081C0AFC + 0x11e0
    .4byte 0x20000
    .4byte 0xa
    .4byte 0x0
    .4byte 0x0
