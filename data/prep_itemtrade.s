	.section .data

	.global ProcScr_PrepItemTradeScreen
ProcScr_PrepItemTradeScreen:  @ 0x08A1901C
	@ PROC_YIELD
	.short 0xe, 0x0
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_809B86C
	@ PROC_CALL_ARG
	.short 0x18, 0x10
	.word NewFadeIn
	@ PROC_WHILE
	.short 0x14, 0x0
	.word FadeInExists
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word sub_809BB34
	@ PROC_CALL_ARG
	.short 0x18, 0x10
	.word NewFadeOut
	@ PROC_WHILE
	.short 0x14, 0x0
	.word FadeOutExists
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_809BE24
	@ PROC_END
	.short 0x0, 0x0
	.word 0x0
