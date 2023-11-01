    .section .rodata

	.global Objs1_SysBrownBox
Objs1_SysBrownBox:  @ 0x08205E18
@ replacing .incbin "baserom.gba", 0x00205e18, 0x10
.4byte Obj_SmallBrownNameBoxe1
.4byte Obj_SmallBrownNameBoxe2
.4byte Obj_SmallBrownNameBoxe3
.4byte Obj_SmallBrownNameBoxe4

	.global Objs2_SysBrownBox
Objs2_SysBrownBox:  @ 0x08205E28
@ Replacing .incbin "baserom.gba", 0x205E28, 0x10
    .4byte Obj_SmallBrownNameBoxe5
    .4byte Obj_SmallBrownNameBoxe5
    .4byte Obj_SmallBrownNameBoxe6
    .4byte Obj_SmallBrownNameBoxe6
