@ range: 0x80D3F8 ~ 0x8ACBE0

    .section .data

    .global data_portrait
data_portrait:
    .incbin "baserom.gba", 0x80D3F8, 0x9F7E8

@ test: placeholder until portrait_data.c completes

    .global portrait_data_temp
portrait_data_temp:
    .incbin "baserom.gba", 0x8ACBE0, 0x12EC

