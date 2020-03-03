    .include "macro.inc"

    .section .data

    .global gUnknown_08599734
gUnknown_08599734:  @ 0x08599734
    .incbin "graphics/generic_icon/0.4bpp"

    .global gUnknown_08599934
gUnknown_08599934:  @ 0x08599934
    .incbin "graphics/generic_icon/1.4bpp"

    .global gUnknown_08599B34
gUnknown_08599B34:  @ 0x08599B34
    .incbin "graphics/generic_icon/2.4bpp"

    .global gUnknown_08599D34
gUnknown_08599D34:  @ 0x08599D34
    .incbin "graphics/generic_icon/3.4bpp"

    .global gUnknown_08599F34
gUnknown_08599F34:  @ 0x08599F34
    .incbin "graphics/generic_icon/0.gbapal" @ 1st team color [blue]

    .global gUnknown_08599F54
gUnknown_08599F54:  @ 0x08599F54
    .incbin "graphics/generic_icon/1.gbapal" @ 2nd team color [orange]

    .global gUnknown_08599F74
gUnknown_08599F74:  @ 0x08599F74
    .incbin "graphics/generic_icon/2.gbapal" @ 3rd team color [green]

    @ 4th team [purple] ends up being unused as there is no way to have generics in the arena, which is the only place where the 4th team exists.
    .incbin "graphics/generic_icon/3.gbapal"

    .global gUnknown_08599FB4
gUnknown_08599FB4:  @ 0x08599FB4
    .word CopyDirect
    .word CopyDirect
    .word LZ77UnCompVram
    .word LZ77UnCompWram
    .word HuffUnComp
    .word HuffUnComp
    .word RLUnCompVram
    .word RLUnCompWram

    .global gUnknown_08599FD4
gUnknown_08599FD4:  @ 0x08599FD4
    .2byte 14
    .2byte 0
    .4byte NULL

    .2byte 2
    .2byte 0
    .4byte sub_801378C

    .2byte 3
    .2byte 0
    .4byte sub_8013794

    .2byte 0
    .2byte 0
    .4byte NULL

    .global gUnknown_08599FF4
gUnknown_08599FF4:  @ 0x08599FF4
    .2byte 2
    .2byte 0
    .4byte AddSkipThread2

    .2byte 2
    .2byte 0
    .4byte sub_8013860

    .2byte 3
    .2byte 0
    .4byte sub_8013870

    .global gUnknown_0859A00C
gUnknown_0859A00C:  @ 0x0859A00C
    .2byte 15
    .2byte 10
    .4byte NULL

    .2byte 3
    .2byte 0
    .4byte sub_801399C

    .2byte 0
    .2byte 0
    .4byte NULL

    .global gUnknown_0859A024
gUnknown_0859A024:  @ 0x0859A024
    .2byte 2
    .2byte 0
    .4byte sub_8013AF4

    .2byte 14
    .2byte 0
    .4byte NULL

    .2byte 3
    .2byte 0
    .4byte sub_8013B5C

    .2byte 16
    .2byte 0
    .4byte NULL

    .global gUnknown_0859A044
gUnknown_0859A044:  @ 0x0859A044
    .2byte 2
    .2byte 0
    .4byte sub_8013BA0

    .2byte 14
    .2byte 0
    .4byte NULL

    .2byte 3
    .2byte 0
    .4byte sub_8013C18

    .2byte 16
    .2byte 0
    .4byte NULL

    .global gUnknown_0859A064
gUnknown_0859A064:  @ 0x0859A064
    .2byte 2
    .2byte 0
    .4byte sub_8013C58

    .2byte 14
    .2byte 0
    .4byte NULL

    .2byte 3
    .2byte 0
    .4byte sub_8013B5C

    .2byte 16
    .2byte 0
    .4byte NULL

    .global gUnknown_0859A084
gUnknown_0859A084:  @ 0x0859A084
    .2byte 2
    .2byte 0
    .4byte sub_8013C70

    .2byte 14
    .2byte 0
    .4byte NULL

    .2byte 3
    .2byte 0
    .4byte sub_8013C18

    .2byte 16
    .2byte 0
    .4byte NULL

    .global gUnknown_0859A0A4
gUnknown_0859A0A4:  @ 0x0859A0A4
    .2byte 15
    .2byte 10
    .4byte NULL

    .2byte 2
    .2byte 0
    .4byte sub_80140F4

    .2byte 14
    .2byte 0
    .4byte NULL

    .2byte 2
    .2byte 0
    .4byte sub_8014124

    .2byte 3
    .2byte 0
    .4byte sub_8014100

    .2byte 0
    .2byte 0
    .4byte NULL

    .global gUnknown_0859A0D4
gUnknown_0859A0D4:  @ 0x0859A0D4
    .2byte 14
    .2byte 0
    .4byte NULL

    .2byte 3
    .2byte 0
    .4byte Timer6C_Countdown

    .2byte 0
    .2byte 0
    .4byte NULL

    .global gUnknown_0859A0EC
gUnknown_0859A0EC:  @ 0x0859A0EC
    .incbin "baserom.gba", 0x59A0EC, 0x4

    .global gUnknown_0859A0F0
gUnknown_0859A0F0:  @ 0x0859A0F0
    .incbin "baserom.gba", 0x59A0F0, 0x3

    .global gUnknown_0859A0F3
gUnknown_0859A0F3:  @ 0x0859A0F3
    .incbin "baserom.gba", 0x59A0F3, 0x1

    .global gUnknown_0859A0F4
gUnknown_0859A0F4:  @ 0x0859A0F4
    .incbin "baserom.gba", 0x59A0F4, 0x4

    .global gUnknown_0859A0F8
gUnknown_0859A0F8:  @ 0x0859A0F8
    .2byte 3
    .2byte 0
    .4byte sub_80144FC

    .global gUnknown_0859A100
gUnknown_0859A100:  @ 0x0859A100
    .2byte 3
    .2byte 0
    .4byte FutureCall2_Loop

    .2byte 0
    .2byte 0
    .4byte NULL

    .global gUnknown_0859A110
gUnknown_0859A110:  @ 0x0859A110
    .2byte 3
    .2byte 0
    .4byte FutureCall_Loop

    .2byte 0
    .2byte 0
    .4byte NULL

    .global gUnknown_0859A120
gUnknown_0859A120:  @ 0x0859A120
    .incbin "baserom.gba", 0x59A120, 0x20

    .global gUnknown_0859A140
gUnknown_0859A140:  @ 0x0859A140
    .incbin "baserom.gba", 0x59A140, 0x20

    .global gUnknown_0859A160
gUnknown_0859A160:  @ 0x0859A160
    .incbin "baserom.gba", 0x59A160, 0x20

    .global gUnknown_0859A180
gUnknown_0859A180:  @ 0x0859A180
    .incbin "baserom.gba", 0x59A180, 0x20

    .global gUnknown_0859A1A0
gUnknown_0859A1A0:  @ 0x0859A1A0
    .incbin "baserom.gba", 0x59A1A0, 0x20

    .global gUnknown_0859A1C0
gUnknown_0859A1C0:  @ 0x0859A1C0
    .incbin "baserom.gba", 0x59A1C0, 0x20

    .global gUnknown_0859A1E0
gUnknown_0859A1E0:  @ 0x0859A1E0
    .2byte 3
    .2byte 0
    .4byte sub_8014968

    .2byte 0
    .2byte 0
    .4byte NULL

    .global gProc_BMapMain
gProc_BMapMain:  @ 0x0859A1F0
    .2byte 14
    .2byte 0
    .4byte NULL

    .2byte 1
    .2byte 0
    .4byte gUnknown_080D79C4

    .2byte 21
    .2byte 0
    .4byte NULL

    .2byte 15
    .2byte 2
    .4byte NULL

    .2byte 14
    .2byte 0
    .4byte NULL

    .2byte 11
    .2byte 0
    .4byte NULL

    .2byte 2
    .2byte 0
    .4byte sub_801550C

    .2byte 14
    .2byte 0
    .4byte NULL

    .2byte 11
    .2byte 1
    .4byte NULL

    .2byte 2
    .2byte 0
    .4byte SetEventId_0x84

    .2byte 2
    .2byte 0
    .4byte UpdatePrevDeployStates

    .2byte 22
    .2byte 0
    .4byte CallBeginningEvents

    .2byte 2
    .2byte 0
    .4byte UndeployEveryone

    .2byte 11
    .2byte 11
    .4byte NULL

    .2byte 2
    .2byte 0
    .4byte UnsetEventId_0x84

    .2byte 11
    .2byte 3
    .4byte NULL

    .2byte 22
    .2byte 0
    .4byte sub_8015410

    .2byte 2
    .2byte 0
    .4byte E_BMAPMAIN_SuspendGame

    .2byte 11
    .2byte 9
    .4byte NULL

    .2byte 5
    .2byte 0
    .4byte gUnknown_0859AE00

    .2byte 6
    .2byte 1
    .4byte gUnknown_0859AF80

    .2byte 8
    .2byte 0
    .4byte gUnknown_0859A548

    .2byte 2
    .2byte 0
    .4byte TickActiveFactionTurn

    .2byte 6
    .2byte 1
    .4byte gUnknown_0859E438

    .2byte 6
    .2byte 1
    .4byte gUnknown_0859E308

    .2byte 6
    .2byte 1
    .4byte gUnknown_0859E368

    .2byte 6
    .2byte 1
    .4byte gUnknown_0859E3D0

    .2byte 6
    .2byte 1
    .4byte gUnknown_0859AE00

    .2byte 22
    .2byte 0
    .4byte sub_8015434

    .2byte 11
    .2byte 5
    .4byte NULL

    .2byte 3
    .2byte 0
    .4byte MakePhaseController6C

    .2byte 6
    .2byte 1
    .4byte gProcScr_BerserkCpPhase

    .2byte 22
    .2byte 0
    .4byte sub_80154C8

    .2byte 12
    .2byte 3
    .4byte NULL

    .2byte 11
    .2byte 2
    .4byte NULL

    .2byte 2
    .2byte 0
    .4byte sub_80155C4

    .2byte 14
    .2byte 0
    .4byte NULL

    .2byte 6
    .2byte 1
    .4byte gUnknown_0859B578

    .2byte 14
    .2byte 0
    .4byte NULL

    .2byte 12
    .2byte 1
    .4byte NULL

    .2byte 11
    .2byte 4
    .4byte NULL

    .2byte 2
    .2byte 0
    .4byte RenderBmMap

    .2byte 2
    .2byte 0
    .4byte sub_80160D0

    .2byte 2
    .2byte 0
    .4byte sub_8013D8C

    .2byte 3
    .2byte 0
    .4byte ContinueUntilSomeTransistion6CExists

    .2byte 12
    .2byte 5
    .4byte NULL

    .2byte 11
    .2byte 6
    .4byte NULL

    .2byte 2
    .2byte 0
    .4byte RenderBmMap

    .2byte 2
    .2byte 0
    .4byte sub_80160D0

    .2byte 2
    .2byte 0
    .4byte sub_8013D8C

    .2byte 3
    .2byte 0
    .4byte ContinueUntilSomeTransistion6CExists

    .2byte 3
    .2byte 0
    .4byte NewPlayerPhase6C

    .2byte 6
    .2byte 1
    .4byte gProcScr_BerserkCpPhase

    .2byte 12
    .2byte 3
    .4byte NULL

    .2byte 11
    .2byte 10
    .4byte NULL

    .2byte 14
    .2byte 0
    .4byte NULL

    .2byte 3
    .2byte 0
    .4byte NewPlayerPhase6C

    .2byte 6
    .2byte 1
    .4byte gProcScr_BerserkCpPhase

    .2byte 12
    .2byte 3
    .4byte NULL

    .2byte 11
    .2byte 8
    .4byte NULL

    .2byte 2
    .2byte 0
    .4byte RenderBmMap

    .2byte 2
    .2byte 0
    .4byte sub_80160D0

    .2byte 2
    .2byte 0
    .4byte sub_8013D8C

    .2byte 3
    .2byte 0
    .4byte ContinueUntilSomeTransistion6CExists

    .2byte 12
    .2byte 9
    .4byte NULL

    .2byte 11
    .2byte 7
    .4byte NULL

    .2byte 2
    .2byte 0
    .4byte RenderBmMap

    .2byte 2
    .2byte 0
    .4byte sub_80160D0

    .2byte 2
    .2byte 0
    .4byte sub_8013D8C

    .2byte 3
    .2byte 0
    .4byte ContinueUntilSomeTransistion6CExists

    .2byte 6
    .2byte 1
    .4byte gProcScr_BerserkCpPhase

    .2byte 12
    .2byte 3
    .4byte NULL

    .2byte 0
    .2byte 0
    .4byte NULL

    .global gUnknown_0859A438
gUnknown_0859A438:  @ 0x0859A438
    .incbin "baserom.gba", 0x59A438, 0x20

    .global gUnknown_0859A458
gUnknown_0859A458:  @ 0x0859A458
    .incbin "baserom.gba", 0x59A458, 0x1A

    .global gUnknown_0859A472
gUnknown_0859A472:  @ 0x0859A472
    .incbin "baserom.gba", 0x59A472, 0x1A

    .global gUnknown_0859A48C
gUnknown_0859A48C:  @ 0x0859A48C
    .incbin "baserom.gba", 0x59A48C, 0x1A

    .global gUnknown_0859A4A6
gUnknown_0859A4A6:  @ 0x0859A4A6
    .incbin "baserom.gba", 0x59A4A6, 0x1A

    .global gUnknown_0859A4C0
gUnknown_0859A4C0:  @ 0x0859A4C0
    .word gUnknown_0859A458
    .word gUnknown_0859A458
    .word gUnknown_0859A458
    .word gUnknown_0859A458
    .word gUnknown_0859A458
    .word gUnknown_0859A458
    .word gUnknown_0859A458
    .word gUnknown_0859A458
    .word gUnknown_0859A458
    .word gUnknown_0859A458
    .word gUnknown_0859A472
    .word gUnknown_0859A48C
    .word gUnknown_0859A48C
    .word gUnknown_0859A48C
    .word gUnknown_0859A48C
    .word gUnknown_0859A472

    .global gUnknown_0859A500
gUnknown_0859A500:  @ 0x0859A500
    .incbin "baserom.gba", 0x59A500, 0x8

    .global gUnknown_0859A508
gUnknown_0859A508:  @ 0x0859A508
    .incbin "baserom.gba", 0x59A508, 0x8

    .global gUnknown_0859A510
gUnknown_0859A510:  @ 0x0859A510
    .incbin "baserom.gba", 0x59A510, 0x8

    .global gUnknown_0859A518
gUnknown_0859A518:  @ 0x0859A518
    .incbin "baserom.gba", 0x59A518, 0x8

    .global gUnknown_0859A520
gUnknown_0859A520:  @ 0x0859A520
    .incbin "baserom.gba", 0x59A520, 0x8

    .global gUnknown_0859A528
gUnknown_0859A528:  @ 0x0859A528
    .incbin "baserom.gba", 0x59A528, 0x8

    .global gUnknown_0859A530
gUnknown_0859A530:  @ 0x0859A530
    .word gUnknown_0859A500
    .word gUnknown_0859A508
    .word gUnknown_0859A510

    .global gUnknown_0859A53C
gUnknown_0859A53C:  @ 0x0859A53C
    .word gUnknown_0859A518
    .word gUnknown_0859A520
    .word gUnknown_0859A528

    .global gUnknown_0859A548
gUnknown_0859A548:  @ 0x0859A548
    .2byte 1
    .2byte 0
    .4byte gUnknown_080D79D0

    .2byte 14
    .2byte 0
    .4byte NULL

    .2byte 2
    .2byte 0
    .4byte Init6C_GENS

    .2byte 3
    .2byte 0
    .4byte Loop6C_GENS

    .2byte 0
    .2byte 0
    .4byte NULL

    .global gUnknown_0859A570
gUnknown_0859A570:  @ 0x0859A570
    .2byte 3
    .2byte 0
    .4byte sub_8015F40

    .2byte 0
    .2byte 0
    .4byte NULL

    .global gUnknown_0859A580
gUnknown_0859A580:  @ 0x0859A580
    .2byte 4
    .2byte 0
    .4byte sub_801613C

    .2byte 3
    .2byte 0
    .4byte sub_80160E0

    .2byte 0
    .2byte 0
    .4byte NULL
