@ AP (object/sprite animation) definition(s). Offset tables computed via assembler
@ label arithmetic; OAM/anim data uses the macros in include/ap.inc. See include/ap.h
@ / src/ap.c. Byte-identical to the original data.

	.include "ap.inc"

	.data
	.global SpriteAnim_BrownTextBox
	.align 1, 0
	.type SpriteAnim_BrownTextBox, %object
SpriteAnim_BrownTextBox:
	.hword .LSpriteAnim_BrownTextBox_ftab - SpriteAnim_BrownTextBox, .LSpriteAnim_BrownTextBox_atab - SpriteAnim_BrownTextBox
.LSpriteAnim_BrownTextBox_ftab:
	.hword .LSpriteAnim_BrownTextBox_frame_0 - .LSpriteAnim_BrownTextBox_ftab
	.hword .LSpriteAnim_BrownTextBox_frame_1 - .LSpriteAnim_BrownTextBox_ftab
.LSpriteAnim_BrownTextBox_atab:
	.hword .LSpriteAnim_BrownTextBox_anim_0 - .LSpriteAnim_BrownTextBox_atab
	.hword .LSpriteAnim_BrownTextBox_anim_1 - .LSpriteAnim_BrownTextBox_atab
.LSpriteAnim_BrownTextBox_frame_0:
	ap_objs 20
	ap_obj 0x4000, 0x4000, 0x0000
	ap_obj 0x4000, 0x4040, 0x0002
	ap_obj 0x4000, 0x0020, 0x0002
	ap_obj 0x4018, 0x4000, 0x000D
	ap_obj 0x4018, 0x4040, 0x000F
	ap_obj 0x4018, 0x0020, 0x000F
	ap_obj 0x4008, 0x4000, 0x0006
	ap_obj 0x4008, 0x4040, 0x0007
	ap_obj 0x0010, 0x0000, 0x000B
	ap_obj 0x0010, 0x0058, 0x000C
	ap_obj 0x4008, 0x0020, 0x0007
	ap_obj 0x4010, 0x0008, 0x0007
	ap_obj 0x4010, 0x0018, 0x0007
	ap_obj 0x4010, 0x0038, 0x0007
	ap_obj 0x4010, 0x0048, 0x0007
	ap_obj 0x4010, 0x0038, 0x0007
	ap_obj 0x4010, 0x0028, 0x0007
	ap_obj 0x4008, 0x0030, 0x0007
	ap_obj 0x4000, 0x0030, 0x0002
	ap_obj 0x4018, 0x0030, 0x000F
.LSpriteAnim_BrownTextBox_frame_1:
	ap_objs 15
	ap_obj 0x4000, 0x4000, 0x0000
	ap_obj 0x4000, 0x4030, 0x0002
	ap_obj 0x4000, 0x0020, 0x0002
	ap_obj 0x4018, 0x4000, 0x000D
	ap_obj 0x4018, 0x4030, 0x000F
	ap_obj 0x4018, 0x0020, 0x000F
	ap_obj 0x4008, 0x4000, 0x0006
	ap_obj 0x4008, 0x4030, 0x0007
	ap_obj 0x0010, 0x0000, 0x000B
	ap_obj 0x0010, 0x0048, 0x000C
	ap_obj 0x4008, 0x0020, 0x0007
	ap_obj 0x4010, 0x0008, 0x0007
	ap_obj 0x4010, 0x0018, 0x0007
	ap_obj 0x4010, 0x0038, 0x0007
	ap_obj 0x4010, 0x0028, 0x0007
.LSpriteAnim_BrownTextBox_anim_0:
	ap_anim 4, 0
	ap_anim_end
	ap_anim_loop
.LSpriteAnim_BrownTextBox_anim_1:
	ap_anim 4, 1
	ap_anim_end
	ap_anim_loop
	.hword 0x0000  @ trailing padding
	.size SpriteAnim_BrownTextBox, . - SpriteAnim_BrownTextBox
