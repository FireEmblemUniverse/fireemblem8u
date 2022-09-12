    .section .data

	.global gUnknown_0859B668
gUnknown_0859B668:  @ 0x0859B668
@ replacing .incbin "baserom.gba", 0x0059b668, 0x4
.4byte gUnknown_02020188

	.global gUnknown_0859B66C
gUnknown_0859B66C:  @ 0x0859B66C
	.incbin "baserom.gba", 0x59B66C, 0x10

	.global gUnknown_0859B67C
gUnknown_0859B67C:  @ 0x0859B67C
	.incbin "baserom.gba", 0x59B67C, 0xC0

	.global gUnknown_0859B73C
gUnknown_0859B73C:  @ 0x0859B73C
	.incbin "baserom.gba", 0x59B73C, 0xB8

	.global gUnknown_0859B7F4
gUnknown_0859B7F4:  @ 0x0859B7F4
@ Replacing .incbin "baserom.gba", 0x59B7F4, 0x64
    .4byte gUnknown_0859B73C + 0x80
    .4byte gUnknown_0859B73C + 0x88
    .4byte gUnknown_0859B73C + 0x90
    .4byte gUnknown_0859B73C + 0x98
    .4byte gUnknown_0859B73C + 0xa0
    .4byte gUnknown_0859B73C + 0xa8
    .4byte gUnknown_0859B73C + 0xb0
    .4byte 0x40000001
    .4byte 0x18420000
    .4byte 0x40010001
    .4byte 0x18620001
    .4byte 0x40010001
    .4byte 0x18440000
    .4byte 0x40000001
    .4byte 0x18420001
    .4byte 0x40000001
    .4byte 0x18620002
    .4byte 0x40010001
    .4byte 0x18440000
    .4byte 0x40000001
    .4byte 0x184201ff
    .4byte 0x40010001
    .4byte 0x18620001
    .4byte 0x40010001
    .4byte 0x18440002

	.global gUnknown_0859B858
gUnknown_0859B858:  @ 0x0859B858
@ Replacing .incbin "baserom.gba", 0x59B858, 0x40
    .4byte gUnknown_0859B7F4 + 0x1c
    .4byte gUnknown_0859B7F4 + 0x24
    .4byte gUnknown_0859B7F4 + 0x2c
    .4byte gUnknown_0859B7F4 + 0x34
    .4byte gUnknown_0859B7F4 + 0x3c
    .4byte gUnknown_0859B7F4 + 0x44
    .4byte gUnknown_0859B7F4 + 0x4c
    .4byte gUnknown_0859B7F4 + 0x54
    .4byte gUnknown_0859B7F4 + 0x5c
    .4byte 0x10000
    .4byte 0x4000
    .4byte 0x11866
    .4byte 0x40ff
    .4byte 0x11846
    .4byte 0x400000fe
    .4byte 0x1848

	.global gUnknown_0859B898
gUnknown_0859B898:  @ 0x0859B898
@ Replacing .incbin "baserom.gba", 0x59B898, 0xA0
    .4byte gUnknown_0859B858 + 0x26
    .4byte gUnknown_0859B858 + 0x2e
    .4byte gUnknown_0859B858 + 0x36
    .4byte gUnknown_0859B858 + 0x36
    .4byte gUnknown_0859B858 + 0x36
    .4byte gUnknown_0859B858 + 0x36
    .4byte gUnknown_0859B858 + 0x36
    .4byte gUnknown_0859B858 + 0x36
    .4byte gUnknown_0859B858 + 0x36
    .4byte gUnknown_0859B858 + 0x36
    .4byte gUnknown_0859B858 + 0x36
    .4byte gUnknown_0859B858 + 0x2e
    .4byte gUnknown_0859B858 + 0x26
    .4byte gUnknown_0859B858 + 0x24
    .4byte gUnknown_0859B858 + 0x24
    .4byte gUnknown_0859B858 + 0x24
    .4byte gUnknown_0859B858 + 0x24
    .4byte gUnknown_0859B858 + 0x24
    .4byte 0x80000002
    .4byte 0x18400002
    .4byte 0xa8003
    .4byte 0x21841
    .4byte 0x100280ff
    .4byte 0x80021840
    .4byte 0x18411008
    .4byte 0x80fe0002
    .4byte 0x18400002
    .4byte 0xa8001
    .4byte 0x21841
    .4byte 0x100280fd
    .4byte 0x80001840
    .4byte 0x18411008
    .4byte 0x80fc0001
    .4byte 0x18400004
    .4byte 0x80fb0001
    .4byte 0x18410004
    .4byte 0x80fa0001
    .4byte 0x18400004
    .4byte 0x80f90001
    .4byte 0x18411004

	.global gUnknown_0859B938
gUnknown_0859B938:  @ 0x0859B938
@ replacing .incbin "baserom.gba", 0x0059b938, 0x30
.4byte gUnknown_0859B898 + 0x48
.4byte gUnknown_0859B898 + 0x56
.4byte gUnknown_0859B898 + 0x64
.4byte gUnknown_0859B898 + 0x72
.4byte gUnknown_0859B898 + 0x80
.4byte gUnknown_0859B898 + 0x88
.4byte gUnknown_0859B898 + 0x90
.4byte gUnknown_0859B898 + 0x98
.4byte gUnknown_0859B898 + 0x98
.4byte gUnknown_0859B858 + 0x24
.4byte gUnknown_0859B858 + 0x24
.4byte gUnknown_0859B858 + 0x24

	.global gUnknown_0859B968
gUnknown_0859B968:  @ 0x0859B968
	.incbin "baserom.gba", 0x59B968, 0xE

	.global gUnknown_0859B976
gUnknown_0859B976:  @ 0x0859B976
	.incbin "baserom.gba", 0x59B976, 0x8

	.global gUnknown_0859B97E
gUnknown_0859B97E:  @ 0x0859B97E
	.incbin "baserom.gba", 0x59B97E, 0x8

	.global gUnknown_0859B986
gUnknown_0859B986:  @ 0x0859B986
	.incbin "baserom.gba", 0x59B986, 0x8

	.global gUnknown_0859B98E
gUnknown_0859B98E:  @ 0x0859B98E
    .incbin "baserom.gba", 0x59B98E, 0x8

	.global gUnknown_0859B996
gUnknown_0859B996:  @ 0x0859B996
	.incbin "baserom.gba", 0x59B996, 0x8

	.global gUnknown_0859B99E
gUnknown_0859B99E:  @ 0x0859B99E
	.incbin "baserom.gba", 0x59B99E, 0xA
