	.include "asm/macros/m4a.inc"

	.equiv TRACK_SIZE, 0x50
	.equiv NUM_TRACKS_BGM1, 8
	.equiv NUM_TRACKS_BGM2, 8
	.equiv NUM_TRACKS_SE1_SYS1, 2
	.equiv NUM_TRACKS_SE2_SYS2, 2
	.equiv NUM_TRACKS_SE3_BMP1, 4
	.equiv NUM_TRACKS_SE4_BMP2, 4
	.equiv NUM_TRACKS_SE5_BMP3, 5
	.equiv NUM_TRACKS_SE6_BMP4, 4
	.equiv NUM_TRACKS_SE7_EVT, 2

	.bss

	.global gMPlayTrack_BGM1
gMPlayTrack_BGM1:
	.space TRACK_SIZE * NUM_TRACKS_BGM1
	.size gMPlayTrack_BGM1, .-gMPlayTrack_BGM1

	.global gMPlayTrack_BGM2
gMPlayTrack_BGM2:
	.space TRACK_SIZE * NUM_TRACKS_BGM2
	.size gMPlayTrack_BGM2, .-gMPlayTrack_BGM2

	.global gMPlayTrack_SE1_SYS1
gMPlayTrack_SE1_SYS1:
	.space TRACK_SIZE * NUM_TRACKS_SE1_SYS1
	.size gMPlayTrack_SE1_SYS1, .-gMPlayTrack_SE1_SYS1

	.global gMPlayTrack_SE2_SYS2
gMPlayTrack_SE2_SYS2:
	.space TRACK_SIZE * NUM_TRACKS_SE2_SYS2
	.size gMPlayTrack_SE2_SYS2, .-gMPlayTrack_SE2_SYS2

	.global gMPlayTrack_SE3_BMP1
gMPlayTrack_SE3_BMP1:
	.space TRACK_SIZE * NUM_TRACKS_SE3_BMP1
	.size gMPlayTrack_SE3_BMP1, .-gMPlayTrack_SE3_BMP1

	.global gMPlayTrack_SE4_BMP2
gMPlayTrack_SE4_BMP2:
	.space TRACK_SIZE * NUM_TRACKS_SE4_BMP2
	.size gMPlayTrack_SE4_BMP2, .-gMPlayTrack_SE4_BMP2

	.global gMPlayTrack_SE5_BMP3
gMPlayTrack_SE5_BMP3:
	.space TRACK_SIZE * NUM_TRACKS_SE5_BMP3
	.size gMPlayTrack_SE5_BMP3, .-gMPlayTrack_SE5_BMP3

	.global gMPlayTrack_SE6_BMP4
gMPlayTrack_SE6_BMP4:
	.space TRACK_SIZE * NUM_TRACKS_SE6_BMP4
	.size gMPlayTrack_SE6_BMP4, .-gMPlayTrack_SE6_BMP4

	.global gMPlayTrack_SE7_EVT
gMPlayTrack_SE7_EVT:
	.space TRACK_SIZE * NUM_TRACKS_SE7_EVT
	.size gMPlayTrack_SE7_EVT, .-gMPlayTrack_SE7_EVT

	.section .rodata

	.align 2
	.global gMPlayTable
gMPlayTable:
	music_player gMPlayInfo_BGM1, gMPlayTrack_BGM1, NUM_TRACKS_BGM1, 0
	music_player gMPlayInfo_BGM2, gMPlayTrack_BGM2, NUM_TRACKS_BGM2, 0
	music_player gMPlayInfo_SE1_SYS1, gMPlayTrack_SE1_SYS1, NUM_TRACKS_SE1_SYS1, 1
	music_player gMPlayInfo_SE2_SYS2, gMPlayTrack_SE2_SYS2, NUM_TRACKS_SE2_SYS2, 1
	music_player gMPlayInfo_SE3_BMP1, gMPlayTrack_SE3_BMP1, NUM_TRACKS_SE3_BMP1, 1
	music_player gMPlayInfo_SE4_BMP2, gMPlayTrack_SE4_BMP2, NUM_TRACKS_SE4_BMP2, 1
	music_player gMPlayInfo_SE5_BMP3, gMPlayTrack_SE5_BMP3, NUM_TRACKS_SE5_BMP3, 1
	music_player gMPlayInfo_SE6_BMP4, gMPlayTrack_SE6_BMP4, NUM_TRACKS_SE6_BMP4, 1
	music_player gMPlayInfo_SE7_EVT, gMPlayTrack_SE7_EVT, NUM_TRACKS_SE7_EVT, 1
