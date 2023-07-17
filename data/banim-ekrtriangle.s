	.section .data

    .global Sprit_08759684
Sprit_08759684:
	.incbin "baserom.gba", 0x759684, 0x75975C - 0x759684

    .global Sprit_0875975C
Sprit_0875975C:
	.incbin "baserom.gba", 0x75975C, 0x75981C - 0x75975C

    .global Sprit_0875981C
Sprit_0875981C:
    .incbin "baserom.gba", 0x75981C, 0x7598DC - 0x75981C

    .global Sprit_087598DC
Sprit_087598DC:
    .incbin "baserom.gba", 0x7598DC, 0x75999C - 0x7598DC

    .global Sprit_0875999C
Sprit_0875999C:
    .incbin "baserom.gba", 0x75999C, 0x759A5C - 0x75999C

    .global Sprit_08759A5C
Sprit_08759A5C:
    .incbin "baserom.gba", 0x759A5C, 0x759B34 - 0x759A5C

	.global BanimScr_08759B34
BanimScr_08759B34:  @ 0x08759B34
    .4byte Sprit_08759684 + 1
    .4byte Sprit_0875975C + 2
    .4byte Sprit_0875981C + 1
    .4byte Sprit_087598DC + 1
    .4byte Sprit_0875999C + 3
    .4byte 0x20000000 + Sprit_08759A5C + 2
    .4byte 0x80000000

	.global Sprit_08759B50
Sprit_08759B50:
	.incbin "baserom.gba", 0x759B50, 0x759C10 - 0x759B50

	.global Sprit_08759C10
Sprit_08759C10:
	.incbin "baserom.gba", 0x759C10, 0x759CD0 - 0x759C10

	.global Sprit_08759CD0
Sprit_08759CD0:
	.incbin "baserom.gba", 0x759CD0, 0x759D90 - 0x759CD0

	.global Sprit_08759D90
Sprit_08759D90:
	.incbin "baserom.gba", 0x759D90, 0x759E68 - 0x759D90

	.global BanimScr_08759E68
BanimScr_08759E68:  @ 0x08759E68
    .4byte Sprit_08759B50 + 2
    .4byte Sprit_08759C10 + 1
    .4byte Sprit_08759CD0 + 2
    .4byte 0x30000000 + Sprit_08759D90
    .4byte 0x80000000

	.global gUnknown_08759E7C
gUnknown_08759E7C:  @ 0x08759E7C
	.incbin "baserom.gba", 0x759E7C, 0x84

	.global gUnknown_08759F00
gUnknown_08759F00:  @ 0x08759F00
	.incbin "baserom.gba", 0x759F00, 0x90

	.global gUnknown_08759F90
gUnknown_08759F90:  @ 0x08759F90
	.incbin "baserom.gba", 0x759F90, 0x90

	.global gUnknown_0875A020
gUnknown_0875A020:  @ 0x0875A020
	.incbin "baserom.gba", 0x75A020, 0x8C

	.global gUnknown_0875A0AC
gUnknown_0875A0AC:  @ 0x0875A0AC
	.incbin "baserom.gba", 0x75A0AC, 0x75A0B8 - 0x75A0AC

Sprit_0875A0B8:
    .incbin "baserom.gba", 0x75A0B8, 0x75A118 - 0x75A0B8

Sprit_0875A118:
    .incbin "baserom.gba", 0x75A118, 0x75A184 - 0x75A118

Sprit_0875A184:
    .incbin "baserom.gba", 0x75A184, 0x75A19C - 0x75A184

	.global BanimScr_0875A19C
BanimScr_0875A19C:  @ 0x0875A19C
    .4byte Sprit_0875A0B8 + 1
    .4byte Sprit_0875A184 + 1
    .4byte Sprit_0875A0B8 + 1
    .4byte Sprit_0875A184 + 1
    .4byte Sprit_0875A0B8 + 1
    .4byte Sprit_0875A184 + 1
    .4byte Sprit_0875A0B8 + 1
    .4byte Sprit_0875A184 + 1
    .4byte Sprit_0875A0B8 + 1
    .4byte Sprit_0875A184 + 1
    .4byte Sprit_0875A0B8 + 1
    .4byte Sprit_0875A184 + 1
    .4byte Sprit_0875A118 + 1
    .4byte Sprit_0875A184 + 1
    .4byte Sprit_0875A118 + 1
    .4byte Sprit_0875A184 + 1
    .4byte Sprit_0875A118 + 1
    .4byte Sprit_0875A184 + 1
    .4byte Sprit_0875A118 + 1
    .4byte Sprit_0875A184 + 1
    .4byte Sprit_0875A118 + 1
    .4byte Sprit_0875A184 + 1
    .4byte Sprit_0875A118 + 1
    .4byte Sprit_0875A184 + 1
    .4byte 0x80000000

Sprit_875A200:
    .4byte 0x80004000
    .4byte 0xffe00000
    .4byte 0x0000fff0
    .4byte 0x40000000
    .4byte 0x00000004
    .4byte 0x0000fff0
    .4byte 0x80004000
    .4byte 0xffea0006
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x000a000a
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfffd000b
    .4byte 0x0000ffe0
    .4byte 0x00004000
    .4byte 0xffed000d
    .4byte 0x0000ffe8
    .4byte 0x00000000
    .4byte 0xfff5000f
    .4byte 0x0000ffe0
    .4byte 0x00004000
    .4byte 0x0010002d
    .4byte 0x0000fff0
    .4byte 0x00000000
    .4byte 0x0020002f
    .4byte 0x0000fff0
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000

Sprit_875A278:
    .4byte 0x80004000
    .4byte 0xffd90040
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0xfff90044
    .4byte 0x00000000
    .4byte 0x80004000
    .4byte 0xffd90045
    .4byte 0x0000fff0
    .4byte 0x40000000
    .4byte 0xfff90049
    .4byte 0x0000fff0
    .4byte 0x80004000
    .4byte 0xffe0004b
    .4byte 0x0000ffe0
    .4byte 0x00000000
    .4byte 0x0000006f
    .4byte 0x0000ffe8
    .4byte 0x40000000
    .4byte 0xffb10050
    .4byte 0x0000fff0
    .4byte 0x00000000
    .4byte 0xffa9004f
    .4byte 0x0000fff0
    .4byte 0x00004000
    .4byte 0xffc10052
    .4byte 0x0000fff3
    .4byte 0x00000000
    .4byte 0xffd10054
    .4byte 0x0000fff3
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000

Sprit_875A2FC:
    .4byte 0x00000000
    .4byte 0x0000001f
    .4byte 0x0000fff8
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000

	.global BanimScr_0875A314
BanimScr_0875A314:  @ 0x0875A314
    .4byte Sprit_875A200 + 1
    .4byte Sprit_875A2FC + 1
    .4byte Sprit_875A200 + 1
    .4byte Sprit_875A2FC + 1
    .4byte Sprit_875A200 + 1
    .4byte Sprit_875A2FC + 1
    .4byte Sprit_875A200 + 1
    .4byte Sprit_875A2FC + 1
    .4byte Sprit_875A200 + 1
    .4byte Sprit_875A2FC + 1
    .4byte Sprit_875A200 + 1
    .4byte Sprit_875A2FC + 1
    .4byte Sprit_875A278 + 1
    .4byte Sprit_875A2FC + 1
    .4byte Sprit_875A278 + 1
    .4byte Sprit_875A2FC + 1
    .4byte Sprit_875A278 + 1
    .4byte Sprit_875A2FC + 1
    .4byte Sprit_875A278 + 1
    .4byte Sprit_875A2FC + 1
    .4byte Sprit_875A278 + 1
    .4byte Sprit_875A2FC + 1
    .4byte Sprit_875A278 + 1
    .4byte Sprit_875A2FC + 1
    .4byte 0x80000000

Sprit_875A378:
    .4byte 0x80004000
    .4byte 0xffe60000
    .4byte 0x0000ffe0
    .4byte 0x00008000
    .4byte 0x00060004
    .4byte 0x0000ffe0
    .4byte 0x80004000
    .4byte 0xffe80005
    .4byte 0x0000fff0
    .4byte 0x00008000
    .4byte 0x00080009
    .4byte 0x0000fff0
    .4byte 0x80004000
    .4byte 0xffea000a
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x000a000e
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000

Sprit_875A3CC:
    .4byte 0x80004000
    .4byte 0xffbc0040
    .4byte 0x0000ffe8
    .4byte 0x80004000
    .4byte 0xffdc0044
    .4byte 0x0000ffe0
    .4byte 0x00008000
    .4byte 0xfffc0048
    .4byte 0x0000ffe0
    .4byte 0x80004000
    .4byte 0xffdc0049
    .4byte 0x0000fff0
    .4byte 0x00008000
    .4byte 0xfffc004d
    .4byte 0x0000fff0
    .4byte 0x80004000
    .4byte 0xffda004e
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0xfffa0052
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00040056
    .4byte 0x0000fff0
    .4byte 0x00004000
    .4byte 0xffc40053
    .4byte 0x0000fff8
    .4byte 0x00000000
    .4byte 0xffd40055
    .4byte 0x0000fff8
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000

Sprit_875A450:
    .4byte 0x00000000
    .4byte 0x0000001f
    .4byte 0x0000fff8
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000

	.global BanimScr_0875A468
BanimScr_0875A468:  @ 0x0875A468
    .4byte Sprit_875A378 + 1
    .4byte Sprit_875A450 + 1
    .4byte Sprit_875A378 + 1
    .4byte Sprit_875A450 + 1
    .4byte Sprit_875A378 + 1
    .4byte Sprit_875A450 + 1
    .4byte Sprit_875A378 + 1
    .4byte Sprit_875A450 + 1
    .4byte Sprit_875A378 + 1
    .4byte Sprit_875A450 + 1
    .4byte Sprit_875A378 + 1
    .4byte Sprit_875A450 + 1
    .4byte Sprit_875A3CC + 1
    .4byte Sprit_875A450 + 1
    .4byte Sprit_875A3CC + 1
    .4byte Sprit_875A450 + 1
    .4byte Sprit_875A3CC + 1
    .4byte Sprit_875A450 + 1
    .4byte Sprit_875A3CC + 1
    .4byte Sprit_875A450 + 1
    .4byte Sprit_875A3CC + 1
    .4byte Sprit_875A450 + 1
    .4byte Sprit_875A3CC + 1
    .4byte Sprit_875A450 + 1
    .4byte 0x80000000

Sprit_875A4CC:
    .4byte 0x80004000
    .4byte 0xffef0000
    .4byte 0x0000ffe0
    .4byte 0x80004000
    .4byte 0xffef0004
    .4byte 0x0000fff0
    .4byte 0x80004000
    .4byte 0xffef0008
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x000f000c
    .4byte 0x0000fffe
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000

Sprit_875A508:
    .4byte 0x80004000
    .4byte 0xffe00040
    .4byte 0x0000ffe1
    .4byte 0x80004000
    .4byte 0xffe00044
    .4byte 0x0000fff1
    .4byte 0x80004000
    .4byte 0xffe00048
    .4byte 0x00000001
    .4byte 0x00008000
    .4byte 0xffd8004c
    .4byte 0x0000ffe9
    .4byte 0x00008000
    .4byte 0xffd8004d
    .4byte 0x0000fff9
    .4byte 0x00000000
    .4byte 0xffd80054
    .4byte 0x00000009
    .4byte 0x00008000
    .4byte 0x0000004e
    .4byte 0x0000ffe9
    .4byte 0x00000000
    .4byte 0x00000055
    .4byte 0x0000fff9
    .4byte 0x40000000
    .4byte 0xffb8004f
    .4byte 0x0000ffed
    .4byte 0x00008000
    .4byte 0xffb00051
    .4byte 0x0000ffeb
    .4byte 0x00004000
    .4byte 0xffb80052
    .4byte 0x0000ffe5
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000

Sprit_875A598:
    .4byte 0x00000000
    .4byte 0x0000005f
    .4byte 0x0000fff8
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000

Sprit_875A5B0:
    .4byte 0x80004000
    .4byte 0xffe00040
    .4byte 0x0000ffe1
    .4byte 0x80004000
    .4byte 0xffe00044
    .4byte 0x0000fff1
    .4byte 0x80004000
    .4byte 0xffe00048
    .4byte 0x00000001
    .4byte 0x00008000
    .4byte 0xffd8004c
    .4byte 0x0000ffe9
    .4byte 0x00008000
    .4byte 0xffd8004d
    .4byte 0x0000fff9
    .4byte 0x00000000
    .4byte 0xffd80054
    .4byte 0x00000009
    .4byte 0x00008000
    .4byte 0x0000004e
    .4byte 0x0000ffe9
    .4byte 0x00000000
    .4byte 0x00000055
    .4byte 0x0000fff9
    .4byte 0x40000000
    .4byte 0xff98004f
    .4byte 0x0000ffed
    .4byte 0x00008000
    .4byte 0xff900051
    .4byte 0x0000ffeb
    .4byte 0x00004000
    .4byte 0xff980052
    .4byte 0x0000ffe5
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000

Sprit_875A640:
    .4byte 0x80004000
    .4byte 0xffe00040
    .4byte 0x0000ffe1
    .4byte 0x80004000
    .4byte 0xffe00044
    .4byte 0x0000fff1
    .4byte 0x80004000
    .4byte 0xffe00048
    .4byte 0x00000001
    .4byte 0x00008000
    .4byte 0xffd8004c
    .4byte 0x0000ffe9
    .4byte 0x00008000
    .4byte 0xffd8004d
    .4byte 0x0000fff9
    .4byte 0x00000000
    .4byte 0xffd80054
    .4byte 0x00000009
    .4byte 0x00008000
    .4byte 0x0000004e
    .4byte 0x0000ffe9
    .4byte 0x00000000
    .4byte 0x00000055
    .4byte 0x0000fff9
    .4byte 0x40000000
    .4byte 0xff80004f
    .4byte 0x0000ffed
    .4byte 0x00004000
    .4byte 0xff800052
    .4byte 0x0000ffe5
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000

Sprit_875A6C4:
    .4byte 0x80004000
    .4byte 0xffe00040
    .4byte 0x0000ffe1
    .4byte 0x80004000
    .4byte 0xffe00044
    .4byte 0x0000fff1
    .4byte 0x80004000
    .4byte 0xffe00048
    .4byte 0x00000001
    .4byte 0x00008000
    .4byte 0xffd8004c
    .4byte 0x0000ffe9
    .4byte 0x00008000
    .4byte 0xffd8004d
    .4byte 0x0000fff9
    .4byte 0x00000000
    .4byte 0xffd80054
    .4byte 0x00000009
    .4byte 0x00008000
    .4byte 0x0000004e
    .4byte 0x0000ffe9
    .4byte 0x00000000
    .4byte 0x00000055
    .4byte 0x0000fff9
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000

	.global BanimScr_0875A730
BanimScr_0875A730:  @ 0x0875A730
    .4byte Sprit_875A4CC + 1
    .4byte Sprit_875A598 + 1
    .4byte Sprit_875A4CC + 1
    .4byte Sprit_875A598 + 1
    .4byte Sprit_875A4CC + 1
    .4byte Sprit_875A598 + 1
    .4byte Sprit_875A4CC + 1
    .4byte Sprit_875A598 + 1
    .4byte Sprit_875A4CC + 1
    .4byte Sprit_875A598 + 1
    .4byte Sprit_875A4CC + 1
    .4byte Sprit_875A598 + 1
    .4byte Sprit_875A508 + 1
    .4byte Sprit_875A598 + 1
    .4byte Sprit_875A5B0 + 1
    .4byte Sprit_875A598 + 1
    .4byte Sprit_875A640 + 1
    .4byte Sprit_875A598 + 1
    .4byte Sprit_875A6C4 + 1
    .4byte Sprit_875A598 + 1
    .4byte Sprit_875A6C4 + 1
    .4byte Sprit_875A598 + 1
    .4byte Sprit_875A6C4 + 1
    .4byte Sprit_875A598 + 1
    .4byte 0x80000000
