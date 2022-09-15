#include "global.h"

#include "proc.h"

enum{
    /* MapAnimLevelUpProc + 0x30 */
	STAT_UP_LV  = 0,
	STAT_UP_HP,
	STAT_UP_POW,
	STAT_UP_SKL,
	STAT_UP_SPD,
	STAT_UP_LCK,
	STAT_UP_DEF,
	STAT_UP_RES,
	STAT_UP_CON,
};

struct MapAnimLevelUpProc {
    PROC_HEADER;

    /* 2A */ u8 _spad_2A[0x2E - 0x2A];
    /* 2E */ s16 unit_index;
	/* 30 */ u8 stat_cur;
	/* 31 */ u8 time_delay;
	/* 32 */ u16 yPos;
	/* 34 */ u16 pad_34;
	/* 36 */ u16 unk_36;
};

extern struct ProcCmd CONST_DATA sProcScr_MapAnimLevelUp[];

ProcPtr StartMapAnimLevelUp(int unit_index, ProcPtr parent)
{
    struct MapAnimLevelUpProc *proc =
        Proc_StartBlocking(sProcScr_MapAnimLevelUp, parent);
    
    proc->unit_index = unit_index;
}

