@ vim:ft=armv4

@ macro used in banim_xxx_oam_r.s and banim_xxx_oam_l.s
@ by laqieer

.macro banim_frame_oam attr0, attr1, attr2, dx, dy
    .hword \attr0, \attr1, \attr2, \dx, \dy, 0
.endm

.macro banim_frame_affine pa, pb, pcc, pd, total=0
    .hword \total
    .if \total
        .hword 0xFFFF
    .else
        .hword 0
    .endif
    .hword \pa, \pb, \pcc, \pd
.endm

.macro banim_frame_end
    .word 1, 0, 0
.endm

