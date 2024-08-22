
    .section .data
    .INCLUDE "gba.inc"
    @ This part of data seems unused
    @ The data is just the same in FE7
    @ FE8U: 0xB1A0B8 ~ +0x567C
    @ FE7J: 0xDC4FBC ~ +0x567C

    .ARM

    b FE6SIO_Init

FE6_RomHeader: @ 0xB1A0BC
    .incbin "baserom.gba", 0xB1A0BC, 0xC0 - 4

FE6SIO_Init: @ 08B1A178
    b _reset
    .WORD 0
    .WORD 0
    .WORD 0
    .WORD 0
    .WORD 0
    .WORD 0
    .WORD 0

sio_polling: @ 0x08B1A198
1:
    ldrh r1, [r0, #8]
    tst r1, #0x80
    beq 1b
1:
    ldrh r1, [r0, #8]
    tst r1, #0x80
    bne 1b
    ldrh r1, [r0, #8]
    tst r1, #0x40
    bxne lr
    ldrh r1, [r0]
    bx lr

_reset: @ 0x08B1A1C4
    ldr r0, .L_REG_SIODATA32
1:
    bl sio_polling
    bne 1b
    mov r2, #0
    strh r2, [r0, #0xa]
    cmp r1, #0
    bne 1b
    mov r2, #0x8000
2:
    mov r1, #0
3:
    strh r1, [r0, #0xa]
    bl sio_polling
    bne 1b
    cmp r1, r2
    bne 2b
    lsr r2, r2, #5
    cmp r1, #0
    bne 3b
    ldr r3, .L_0x020000AC
    ldrh r2, [r3]
    strh r2, [r0, #0xa]
    bl sio_polling
4:
    bne 4b
    cmp r1, r2
    bne 4b
    ldrh r2, [r3, #2]
    strh r2, [r0, #0xa]
    bl sio_polling
    bne 4b
    cmp r1, r2
    bne 4b
    mov r1, #0
    strh r1, [r0, #0xa]
    ldr r0, .L_0x020002B0
    ldr r1, .L_0x02010000
    svc #0x110000
    ldr lr, .L_0x02010000
    bx lr
    .align 2, 0
.L_REG_SIODATA32: .4byte REG_SIODATA32
.L_0x020000AC: .4byte 0x020000AC
.L_0x020002B0: .4byte 0x020002B0
.L_0x02010000: .4byte 0x02010000

    .space 0x100

	.incbin "baserom.gba", 0xB1A368, 0xB1F734 - 0xB1A368
