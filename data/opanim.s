	.section .data

    .global ProcScr_OpAnim
ProcScr_OpAnim:  @ 0x08AA71C8
    @ PROC_YIELD
    .short 0xe, 0x0
    .word 0x0
    @ PROC_CALL
    .short 0x2, 0x0
    .word OpAnimInit
    @ PROC_YIELD
    .short 0xe, 0x0
    .word 0x0
    @ PROC_CALL
    .short 0x2, 0x0
    .word SetupOpAnimWorldMapfx
    @ PROC_START_CHILD
    .short 0x5, 0x0
    .word ProcScr_OpAnimBLDALPHA
    @ PROC_WHILE
    .short 0x14, 0x0
    .word OpAnimBldAlphaExists
    @ PROC_CALL
    .short 0x2, 0x0
    .word OpAnimUpdateScreen1
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C6F70
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80C7050
    @ PROC_YIELD
    .short 0xe, 0x0
    .word 0x0
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word OpAnimPreparefxEphraim
    @ PROC_CALL
    .short 0x2, 0x0
    .word NewProc08AA6D04
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word OpAnimEphraimfxFlyIn
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C7900
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word OpAnim1AdvanceSplitLine
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word OpAnimEphraimMergeShadow
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word OpAnimEphraimDisplayName
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word OpAnimEphraimExit
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word OpAnimPreparefxEirika
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C7F90
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C8100
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C8184
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C8214
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C8278
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C835C
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C84D8
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80C8564
    @ PROC_START_CHILD
    .short 0x5, 0x0
    .word gUnknown_08AA705C
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C8690
    @ PROC_START_CHILD
    .short 0x5, 0x0
    .word gUnknown_08AA704C
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80C9DF0
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C9E6C
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80C9C08
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C9FF8
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80CA10C
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80CA3B8
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80C9EE8
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C9F7C
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80C8564
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C883C
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80C9DF0
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C9E6C
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80C9C5C
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C9FF8
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80CA10C
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80CA3B8
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80C9EE8
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C9F7C
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80C8564
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C8934
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80C9DF0
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C9E6C
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80C9CAC
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C9FF8
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80CA10C
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80CA3B8
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80C9EE8
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C9F7C
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80C8564
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C8A20
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80C9DF0
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C9E6C
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80C9CFC
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C9FF8
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80CA10C
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80CA3B8
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80C9EE8
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C9F7C
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80C8564
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C8B0C
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80C9DF0
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C9E6C
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80C9D4C
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C9FF8
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80CA10C
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80CA3B8
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80C9EE8
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C9F7C
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80C8564
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C8BF8
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80C9DF0
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C9E6C
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80C9DA0
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C9FF8
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80CA10C
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80CA3B8
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80C9EE8
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C9F7C
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80C8564
    @ PROC_START_CHILD
    .short 0x5, 0x0
    .word gUnknown_08AA707C
    @ PROC_END_EACH
    .short 0x9, 0x0
    .word gUnknown_08AA704C
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C8CE4
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80CA4A4
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80CA4DC
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80CA92C
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80C8564
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C8D30
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80CA940
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80CAA38
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80C8564
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C8ED4
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80CA940
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80CABB0
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80C8564
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C9024
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80CA940
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80CAE20
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80C8564
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C9100
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80CA940
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80CAF2C
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80C8564
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C9218
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80CA940
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80CB0A0
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80C8564
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C9330
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80CA940
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80CB20C
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80C8564
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C940C
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80CA940
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80CB320
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80C8564
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C955C
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80CA940
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80CB594
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80C8564
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C9638
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80CA940
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80CB6A0
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80C8564
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C9750
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80CA940
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80CB878
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80C8564
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C98A0
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80CA940
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80CBA64
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80C8564
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C99B8
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80CA940
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80CBC40
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80C8564
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C9A94
    @ PROC_REPEAT
    .short 0x3, 0x0
    .word sub_80C9AFC
    @ PROC_SLEEP
    .short 0xe, 0x20
    .word 0x0
    @ PROC_LABEL
    .short 0xb, 0x63
    .word 0x0
    @ PROC_CALL
    .short 0x2, 0x0
    .word sub_80CBD7C
    @ PROC_SLEEP
    .short 0xe, 0x1
    .word 0x0
    @ PROC_END
    .short 0x0, 0x0
    .word 0x0
