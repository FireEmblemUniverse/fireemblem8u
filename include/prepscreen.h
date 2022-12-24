#ifndef PREP_SCREEN_H

#include "proc.h"

struct ProcAtMenu {
	/* 00 */ PROC_HEADER;
	/* 29 */ u8 unit_count;
	/* 2A */ u8 max_counter; // Total unit number can be on battle
	/* 2B */ u8 cur_counter; // Total unit number to be on battle
	/* 2C */ u8 unk_2C;
	/* 2D */ u8 cur_cmd;
	/* 2E */ u8 unk_2E;
	/* 2F */ u8 unk_2F;
	/* 30 */ u8 unk_30;
	/* 31 */ u8 unk_31;
	/* 32 */ u8 unk_32;
	/* 33 */ u8 state;
	/* 34 */ u8 unk_34;
	/* 35 */ u8 unk_35;
	/* 36 */ bool8 end_prep;
	/* 38 */ u8 unk_38[0x3C - 0x38];
	/* 3C */ u32 yDiff; // y Pos offset of Unit SMS
	/* 40 */ u32 xDiff;
};

#endif /* PREP_SCREEN_H */
