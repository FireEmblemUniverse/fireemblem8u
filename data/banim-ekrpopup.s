    .section .data

	.global ProcScr_ekrPopup
ProcScr_ekrPopup:  @ 0x0878D520
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e829c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word BattlePopup_Wait16Frames
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrPopup_DrawWRankUp
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrPopup_WaitWRankUp
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrPopup_DrawWRankUp2
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrPopup_WaitWRankUp2
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrPopup_DrawWpnBroke
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrPopup_WaitWpnBroke
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrPopup_DrawWpnBroke2
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrPopup_WaitWpnBroke2
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrPopup_MarkEnd
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word nullsub_68
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_ekrPopup2
ProcScr_ekrPopup2:  @ 0x0878D588
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e82a8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word BattlePopup_Wait16Frames
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076250
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076290
        @ PROC_SLEEP
        .short 0xe, 0x14
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80762D0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076290
        @ PROC_LABEL
        .short 0xb, 0x5
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrPopup_MarkEnd
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word nullsub_68
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_ekrHenseiInit
ProcScr_ekrHenseiInit:  @ 0x0878D5F0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e82b4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076380
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80763E0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076400
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076464
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_ekrHenseiEnd
ProcScr_ekrHenseiEnd:  @ 0x0878D620
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e82c8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076484
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80764B0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076514
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
    