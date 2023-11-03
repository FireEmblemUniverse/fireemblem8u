#ifndef GUARD_BB_H
#define GUARD_BB_H

#include "global.h"
#include "fontgrp.h"

struct SubtitleHelpProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ const char * string;
    /* 30 */ struct Font font;
    /* 48 */ struct Text text[2];
    /* 58 */ s16 textOffset;
    /* 5A */ s16 textShowCnt;
    /* 5C */ s16 textNum;
    /* 5E */ s16 textCount;
};


void PutSubtitleHelpText(struct SubtitleHelpProc * proc, int y);
void InitSubtitleHelpText(struct SubtitleHelpProc * proc);
void SubtitleHelpDarkenerOnHBlank();
void SubtitleHelpDarkener_Init();
void SubtitleHelpDarkener_FadeIn();
void SubtitleHelpDarkener_FadeOut(struct SubtitleHelpProc * proc);
void SubtitleHelp_Init(struct SubtitleHelpProc * proc);
void SubtitleHelp_OnEnd(void);
void SubtitleHelp_Loop(struct SubtitleHelpProc * proc);
void StartSubtitleHelp(ProcPtr parent, const char * string);
void EndSubtitleHelp(void);
s8 IsSubtitleHelpActive(void);
void sub_8035770(ProcPtr parent, const char * string);

extern struct ProcCmd gProcScr_SubtitleHelpDarkener[];
extern struct ProcCmd gProcScr_SubtitleHelp[];
extern u8 gUnknown_0859EF20[]; // pal

#endif  // GUARD_BB_H
