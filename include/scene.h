#ifndef GUARD_SCENE_H
#define GUARD_SCENE_H

enum fe_ch_idx {
    CHFE_L_X = '\x0',
    CHFE_L_NL = '\x1',
    CHFE_L_2NL = '\x2',
    CHFE_L_A = '\x3',
    CHFE_L_Pause8 = '\x4',
    CHFE_L_Pause16 = '\x5',
    CHFE_L_Pause32 = '\x6',
    CHFE_L_Pause64 = '\x7',
    CHFE_L_OpenFarLeft = '\x8',
    CHFE_L_OpenMidLeft = '\x9',
    CHFE_L_OpenLeft = '\xA',
    CHFE_L_OpenRight = '\xB',
    CHFE_L_OpenMidRight = '\xC',
    CHFE_L_OpenFarRight = '\xD',
    CHFE_L_OpenFarFarLeft = '\xE',
    CHFE_L_OpenFarFarRight = '\xF',
    CHFE_L_LoadFace = '\x10',
    CHFE_L_ClearFace = '\x11',
    CHFE_L_NormalPrint = '\x12',
    CHFE_L_FastPrint = '\x13',
    CHFE_L_CloseSpeechFast = '\x14',
    CHFE_L_CloseSpeechSlow = '\x15',
    CHFE_L_ToggleMouthMove = '\x16',
    CHFE_L_ToggleSmile = '\x17',
    CHFE_L_Yes = '\x18',
    CHFE_L_No = '\x19',
    CHFE_L_BuySell = '\x1A',
    CHFE_L_ShopContinue = '\x1B',
    CHFE_L_SendToBack = '\x1C',
    CHFE_L_FastPrint2 = '\x1D',
    CHFE_L_DEnd = '\x1F',
};

enum
{
    TALK_FLAG_INSTANTSHIFT   = (1 << 0),
    TALK_FLAG_NOBUBBLE       = (1 << 1),
    TALK_FLAG_NOSKIP         = (1 << 2),
    TALK_FLAG_NOFAST         = (1 << 3),
    TALK_FLAG_4              = (1 << 4),
    TALK_FLAG_SPRITE         = (1 << 5),
    TALK_FLAG_SILENT         = (1 << 6),
    TALK_FLAG_7              = (1 << 7),
    TALK_FLAG_8              = (1 << 8), // disable blend effects?
};

struct TalkState
{
    /* 00 */ const char* str;
    /* 04 */ const char* strBackup;
    /* 08 */ u8 printColor;
    /* 09 */ u8 lineActive;
    /* 0A */ u8 lines;
    /* 0B */ u8 topTextNum;
    /* 0C */ u8 xText;
    /* 0D */ u8 yText;
    /* 0E */ u8 activeWidth;
    /* 0F */ s8 speakingFaceSlot;
    /* 10 */ u8 speakingWidth;
    /* 11 */ u8 activeFaceSlot;
    /* 12 */ s8 instantScroll;
    /* 13 */ s8 printDelay;
    /* 14 */ s8 printClock;
    /* 15 */ u8 putLines;
    /* 16 */ u8 mouthMoveEnabled;
    /* 17 */ u8 faceSmileEnabled;
    /* 18 */ struct FaceProc* faces[8];
    /* 38 */ void(*unk38)(ProcPtr proc);
    /* 3C */ u32 userNumber;
    /* 40 */ char userNumberString[0x20];
    /* 60 */ char userString[0x20];
    /* 80 */ u16 config;
    /* 82 */ u8 unk82;
    /* 83 */ u8 invertedFlags;
};

struct TalkDebugProc {
    PROC_HEADER;

    u8 pad[0x4c-0x29];
    int unk_4c;
    int unk_50;
    int unk_54;
    int unk_58;
    int unk_5c;
    int unk_60;
    s16 unk_64;
};

struct Proc0859163C
{
    PROC_HEADER;
    int unk_2c;
    int unk_30;
    int unk_34;
    int unk_38;
    int unk_3c;
    int unk_40;
    int unk_44;
    int unk_48;
};

struct ChoiceEntryInfo
{
    /* 00 */ u16 msgid;
    /* 04 */ void(*onSwitchIn)(void);
};

struct TalkChoiceProc {
    /* 00 */ PROC_HEADER;

    /* 2A */ s16 selectedChoice;
    /* 2C */ s16 xDisp;
    /* 2E */ s16 yDisp;
    /* 30 */ int pad;
    /* 34 */ const struct ChoiceEntryInfo* choices;
};

void ClearTalkFaceRefs(void);
void InitTalk(int, int, s8);
void InitSpriteTalk(int chr, int lines, int palId);
void sub_8006964(void);
void SetInitTalkTextFont(void);
ProcPtr StartTalkExt(int, int, const char*, ProcPtr);
ProcPtr StartTalkMsg(int, int, int);
ProcPtr StartTalkMsgExt(int x, int y, int msgId, ProcPtr parent);
ProcPtr StartTalk(int x, int y, const char* str);
void EndTalk(void);
void SetTalkLines(int lines);
void ClearAllTalkFlags(void);
void SetTalkFlag(int);
void sub_8006ABC(void(*func)(ProcPtr));
void ClearTalkFlag(int flag);
int CheckTalkFlag(int flag);
void SetTalkPrintDelay(int a);
void SetTalkPrintColor(int a);
void TalkSkipListener_OnIdle(ProcPtr);
void Talk_OnInit(void);
void Talk_OnIdle(ProcPtr);
s8 TalkPrepNextChar(ProcPtr proc);
s8 TalkSpritePrepNextChar(ProcPtr proc);
void LockTalk(ProcPtr proc);
s8 IsTalkLocked(void);
void ResumeTalk(void);
void sub_8006F00(void);
void TalkToggleInvertedPalette(int flag);
int TalkInterpret(ProcPtr);
int SetActiveTalkFace(int);
void SetupFaceGfxDataInBanim(void);
void TalkLoadFace(ProcPtr);
ProcPtr StartTalkFace(int, int, int, int, int);
int GetFaceIdByXPos(int x);
void SetTalkFaceLayer(int talkFace, int toBack);
void MoveTalkFace(int talkFaceFrom, int talkFaceTo);
s8 IsTalkFaceMoving(void);
void StartTalkFaceMove(int talkFaceFrom, int talkFaceTo, s8 isSwap);
void TalkFaceMove_OnInit(struct Proc*);
void TalkFaceMove_OnIdle(struct Proc*);
void Talk_OnEnd(void);
void TalkPause_OnIdle(struct Proc*);
void TalkWaitForInput_OnIdle(struct Proc*);
void sub_8007CD4(void);
void StartTalkWaitForInput(ProcPtr parent, int x, int y);
void StartTalkWaitForInputUnk(ProcPtr parent, int x, int y, int unk);
void TalkShiftClearAll_OnInit(struct Proc*);
void TalkShiftClearAll_OnIdle(struct Proc*);
void StartTalkChoice(const struct ChoiceEntryInfo* choices, struct Text* text, u16* tm, int defaultChoice, int color, ProcPtr parent);
void TalkChoice_OnIdle(struct TalkChoiceProc*);
void TalkShiftClear_OnInit(struct Proc*);
void TalkShiftClear_OnIdle(struct Proc*);
void sub_80080D0(ProcPtr);
void sub_8008108(void);
void TalkFlushAllLine(void);
int GetTalkPauseCmdDuration(int cmd);
void ClearTalkBubble(void);
void ClearPutTalkText(void);
void ClearTalkText(void);
void PutTalkBubble(int xAnchor, int yAnchor, int width, int height);
void StartOpenTalkBubble(void);
void TalkBubbleOpen_OnIdle(struct Proc*);
void InitTalkTextWin(int x, int y, int width, int height);
void PutTalkBubbleTail(int bg, int x, int y, int kind);
void PutTalkBubbleTm(int bg, int x, int y, int width, int height);
void TalkOpen_OnEnd(void);
void TalkOpen_InitBlend(struct Proc* proc);
void TalkOpen_PutTalkBubble(struct Proc* proc);
void TalkOpen_OnIdle(struct Proc* proc);
void StartTalkOpen(int talkFace, ProcPtr parent);
s8 TalkHasCorrectBubble(void);
int GetTalkFaceHPos(int talkFace);
void SetTalkFaceDisp(int talkFace, int faceDisp);
void SetTalkFaceMouthMove(int);
void SetTalkFaceNoMouthMove(int);
s8 IsTalkActive(void);
s8 FaceExists(void);
int GetTalkChoiceResult(void);
int SetTalkChoiceResult(int);
void SetTalkNumber(int);
void SetTalkUnkStr(const char* str);
void PrintStringToTexts(struct Text** texts, const char* str, u16* tm, int unk);
void TalkPutSpriteText_OnIdle(struct Proc*);
void ClearPrimaryHBlank(void);
void TalkPutSpriteText_OnEnd(void);
int GetStrTalkLen(const char*, s8);
bool GetZero(void);
void sub_8008F1C(void);
void TalkBgSync(int bg);
bool sub_8008F3C(void);
void sub_8008F54(void);
void sub_8008F64(int chr, int b, int c, ProcPtr parent);
void sub_8008FAC(struct TalkDebugProc *);
void sub_8008FB4(struct TalkDebugProc *);
void nullsub_15(void);
void sub_800903C(struct Proc0859163C *);
void sub_800904C(struct Proc0859163C *);
void sub_8009100(struct Proc0859163C *);
void sub_800915C(int, int, int, int, int, int, int, ProcPtr);

extern struct ProcCmd gProcScr_TalkOpen[];

#endif  // GUARD_SCENE_H
