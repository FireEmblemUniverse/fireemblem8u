#pragma once

#include "global.h"
#include "proc.h"
#include "fontgrp.h"
#include "statscreen.h"

struct HelpBoxScrollProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ const char * string;
    /* 30 */ struct Font * font;

    /* 34 */ struct Text * texts[9]; // unknown size; 3?

    /* 58 */ int unk_58;
    /* 5C */ s16 pretext_lines;
    /* 5E */ s16 step;
    /* 60 */ u16 speed;
    /* 62 */ s16 chars_per_step;
    /* 64 */ s16 unk_64;
};

struct ProcHelpBoxIntro {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 _pad[0x58-0x29];

    /* 58 */ int item;
    /* 5C */ int msg;
    /* 60 */ int unk_60;
    /* 64 */ s16 pretext_lines; /* lines for  prefix */
};

struct ProcBoxDialogue {
    /* 00 */ PROC_HEADER;

    /* 2C */ int x, y;
    /* 34 */ int msg;

    /* 38 */ u8 unk_38;

    /* 3C */ u16* unk_3c;
    /* 40 */ u8 pad_idx;
};

struct ProcBoxDialogueDrawTextExt {
    /* 00 */ PROC_HEADER;

    /* 2C */ const char * str;
    /* 30 */ struct Font * unk_30;
    /* 34 */ struct Text * texts[5];

    /* 48 */ s16 current_line;
    /* 4A */ s16 unk_4a;
    /* 4C */ s16 unk_4c;
    /* 4E */ s16 unk_4e;
    /* 50 */ u8 unk_50;
    /* 51 */ u8 unk_51;
    /* 52 */ u8 x_offset;
    /* 53 */ u8 unk_53;
    /* 54 */ u8 unk_54;
    /* 55 */ u8 unk_55;
    /* 56 */ u8 unk_56;
    /* 57 */ u8 unk_57;
    /* 58 */ u8 timer;
    /* 59 */ u8 unk_59;
};

struct HelpBox8A01800Proc {
    /* 00 */ PROC_HEADER;

    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;

    /* 34 */ u8 _pad[0x5c-0x34];

    /* 5C */ int unk_5c;
};

struct HelpBoxSt {
    /* 00 */ struct Font font;
    /* 16 */ struct Text text[3];
    /* 30 */ u16 oam2_base;
};

extern struct HelpBoxSt gHelpBoxSt;

struct BoxDialogueConf {
    /* 00 */ struct Font font;
    /* 18 */ struct Text texts[5];
    /* 40 */ u16 unk_40;
    /* 42 */ u16 unk_42;
};

extern struct BoxDialogueConf gBoxDialogueConf;

extern struct HelpBoxInfo gTmpHelpBoxInfo;
extern const struct HelpBoxInfo * gpHelpBoxCurrentInfo;

extern struct ProcCmd gProcScr_HelpBoxTextScroll[];
extern struct ProcCmd ProcScr_HelpBoxIntro[];
extern struct ProcCmd ProcScr_Helpbox_bug_0[];
extern struct ProcCmd gHelpbox_0[];
extern struct ProcCmd gHelpbox_1[];
extern struct ProcCmd gProcScr_BoxDialogue[];
extern struct ProcCmd ProcScr_MergeBoxDialogue[];
extern struct ProcCmd ProcScr_TalkBoxIdle[];

void LoadHelpBoxGfx(void* dest, int pal);
// ??? LoadHelpBoxGfx2(???);
void DisplayHelpBoxObj(int x, int y, int w, int h, int unk);
// ??? DrawHelpBoxWeaponLabels(???);
// ??? DrawHelpBoxWeaponStats(???);
// ??? DrawHelpBoxStaffLabels(???);
// ??? DrawHelpBoxSaveMenuLabels(???);
// ??? DrawHelpBoxSaveMenuStats(???);
// ??? HelpBoxTextScroll_OnLoop(???);
// ??? HelpBoxDrawOneLineExt(???);
// ??? HelpBoxSetupPrefixLines(???);
// ??? HelpBoxDrawPrefix(???);
// ??? HelpBoxIntroDrawTexts(???);
void StartHelpBoxTextInit(int item, int mid);
void ClearHelpBoxText(void);
// ??? HelpBoxIntro_bug_0(???);
// ??? HelpBoxIntro_bug_OnClose(???);
// ??? HelpBoxIntro_bug_WaitClose(???);
// ??? StartHelpBoxAtPos(???);
// ??? StartHelpBoxExtInternal(???);
// ??? CloseHelpBox_bug(???);
// ??? HelpBoxMoveCtrl_OnInitBox(???);
// ??? HelpBoxMoveCtrl_OnIdle(???);
// ??? EndHelpBoxMoveCtrl(???);
void StartHelpBoxMoveCtrl(const struct HelpBoxInfo*);
// ??? IsHelpBoxMoveCtrlActive(???);
void ApplyHelpBoxContentSize_bug(struct HelpBoxProc*, int, int);
void ApplyHelpBoxPosition_bug(struct HelpBoxProc*, int, int);
void SetHelpBoxInitPosition_bug(struct HelpBoxProc*, int, int);
void SetHelpBoxDefaultRect(struct HelpBoxProc*);
int GetHelpBoxItemInfoKind_bug(int);
// ??? HelpBoxLock_OnIdle(???);
// ??? StartHelpoxDirect(???);
// ??? IsBoxDialogueActive(???);
void SetDialogueBoxConfig(u16);
// ??? GetDialogueBoxConfig(???);
// ??? ScrollBoxDialogueTilesUp(???);
// ??? InitBoxDialogue(???);
// ??? ApplyBoxDialoguePosition(???);
// ??? SetBoxDialogueSize(???);
// ??? BoxDialogue_OnInit(???);
// ??? BoxDialogue_OnIdle(???);
// ??? BoxDialogue_OnClose(???);
// ??? BoxDialogue_DrawBoxInterpolated(???);
// ??? MergeBoxDialogue1(???);
// ??? MergeBoxDialogue2(???);
// ??? MergeBoxDialogue3(???);
void EndBoxDialogueMerge(void);
void StartBoxDialogue(int x_tile, int y_tile, int unk_index, ProcPtr parent);
// ??? StartBoxDialogueExt(???);
void GetBoxDialogueSize(const char*, int*, int*);
// ??? DialogBoxGetGlyphLen(???);
void DrawBoxDialogueText(int, int, int);
void PutBoxDialogueBoxSprites(int, int, int, int);
// ??? BoxDialogueDrawText_Init(???);
// ??? BoxDialogue_StopFaceMouthMove(???);
// ??? BoxDialogue_StartFaceMouthMove(???);
// ??? BoxDialogue_ClearTextLines(???);
// ??? BoxDialogueInterpreter_Main(???);
// ??? BoxDialogueDrawText_WaitIdle(???);
// ??? BoxDialogueDrawText_ScrollLines(???);
// ??? BoxDialogueDrawText_AfterScroll(???);
// ??? BoxDialogueDrawText_Finish(???);
// ??? BoxDialogueDrawText_ResizeBox(???);
// ??? BoxDialogueShouldAnimateText(???);
// ??? BoxDialogueDrawTextProc_Init(???);
void StartBoxDialogueDrawText(int, int, int);
void ClearBoxDialogueText(void);
// ??? StartTalkBoxIdle(???);
// ??? IsTalkBoxIdleActive(???);
void EndAllBoxDialogue(void); // ??? (also text related)
