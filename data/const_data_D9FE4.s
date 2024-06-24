    .section .rodata

	.global gUnknown_080DA20C
gUnknown_080DA20C:  @ 0x080DA20C
@ replacing .incbin "baserom.gba", 0x000da20c, 0x10
.4byte gUnknown_085AE7EC + 0x5e8
.4byte gUnknown_085AE7EC + 0x6a4
.4byte gUnknown_085AE7EC + 0x768
.4byte gUnknown_085AE7EC + 0x840

	.global gUnknown_080DA21C
gUnknown_080DA21C:  @ 0x080DA21C
@ replacing .incbin "baserom.gba", 0x000da21c, 0x10
.4byte gUnknown_085AE7EC + 0x904
.4byte gUnknown_085AE7EC + 0x944
.4byte gUnknown_085AE7EC + 0x924
.4byte gUnknown_085AE7EC + 0x964

	.global gUnknown_080DA22C
gUnknown_080DA22C:  @ 0x080DA22C
@ replacing .incbin "baserom.gba", 0xDA22C, 0x30
    .4byte Pal_PhaseChangePlayer
    .4byte Pal_PhaseChangeOther
    .4byte Pal_PhaseChangeEnemy
    .4byte Pal_PhaseChangeOther + 0x20
    .4byte 0x43000001
    .4byte 0x37008000
    .4byte 0x43000001
    .4byte 0x47048200
    .4byte 0x43000001
    .4byte 0x57088400
    .4byte 0x43000001
    .4byte 0x670c8600

	.global gUnknown_080DA25C
gUnknown_080DA25C:  @ 0x080DA25C
	.incbin "baserom.gba", 0xDA25C, 0xE

	.global gUnknown_080DA26A
gUnknown_080DA26A:  @ 0x080DA26A
	.incbin "baserom.gba", 0xDA26A, 0x14

	.global gUnknown_080DA27E
gUnknown_080DA27E:  @ 0x080DA27E
	.incbin "baserom.gba", 0xDA27E, 0x32

	.global gUnknown_080DA2B0
gUnknown_080DA2B0:  @ 0x080DA2B0
	.incbin "baserom.gba", 0xDA2B0, 0x44
