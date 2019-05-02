	.section .rodata

	.align 4
	.incbin "baserom.gba", 0x207470, 0x1CCE0 @ voice_groups.inc
    .incbin "baserom.gba", 0x224150, 0x204 @ keysplit_tables.inc [unused]
    .incbin "baserom.gba", 0x224354, 0xB0 @ programmable_wave_data.inc

	.global gMPlayTable
gMPlayTable:  @ 0x08224404
	.incbin "baserom.gba", 0x224404, 0x6C @ music_player_table.inc

	.global gSongTable
gSongTable:  @ 0x08224470
	.incbin "baserom.gba", 0x224470, 0x1F44 @ song_table.inc
    
    .incbin "baserom.gba", 0x2263B4, 0x36134C @ direct_sound_data.inc
