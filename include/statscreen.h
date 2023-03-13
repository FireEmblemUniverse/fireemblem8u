#ifndef GUARD_STATSCREEN_H
#define GUARD_STATSCREEN_H

enum
{
    // BG palette allocation
    STATSCREEN_BGPAL_HALO = 1,
    STATSCREEN_BGPAL_2 = 2,
    STATSCREEN_BGPAL_3 = 3,
    STATSCREEN_BGPAL_ITEMICONS = 4,
    STATSCREEN_BGPAL_EXTICONS = 5,
    STATSCREEN_BGPAL_6 = 6,
    STATSCREEN_BGPAL_7 = 7,
    STATSCREEN_BGPAL_FACE = 11,
    STATSCREEN_BGPAL_BACKGROUND = 12, // 4 palettes

    // OBJ palette allocation
    STATSCREEN_OBJPAL_4 = 4,
};

enum
{
    STATSCREEN_CONFIG_NONDEAD    = (1 << 0),
    STATSCREEN_CONFIG_NONBENCHED = (1 << 1),
    STATSCREEN_CONFIG_NONUNK9    = (1 << 2),
    STATSCREEN_CONFIG_NONROOFED  = (1 << 3),
    STATSCREEN_CONFIG_NONUNK16   = (1 << 4),
    STATSCREEN_CONFIG_NONSUPPLY  = (1 << 5),
};

enum
{
    STATSCREEN_PAGE_0,
    STATSCREEN_PAGE_1,
    STATSCREEN_PAGE_2,

    STATSCREEN_PAGE_MAX,
};

enum
{
    // Enumerate stat screen texts

    STATSCREEN_TEXT_CHARANAME, // 0
    STATSCREEN_TEXT_CLASSNAME, // 1

    STATSCREEN_TEXT_UNUSUED, // 2 (was Exp?)

    STATSCREEN_TEXT_POWLABEL, // 3
    STATSCREEN_TEXT_SKLLABEL, // 4
    STATSCREEN_TEXT_SPDLABEL, // 5
    STATSCREEN_TEXT_LCKLABEL, // 6
    STATSCREEN_TEXT_DEFLABEL, // 7
    STATSCREEN_TEXT_RESLABEL, // 8
    STATSCREEN_TEXT_MOVLABEL, // 9
    STATSCREEN_TEXT_CONLABEL, // 10
    STATSCREEN_TEXT_AIDLABEL, // 11
    STATSCREEN_TEXT_RESCUENAME, // 12
    STATSCREEN_TEXT_AFFINLABEL, // 13
    STATSCREEN_TEXT_STATUS, // 14

    STATSCREEN_TEXT_ITEM0, // 15
    STATSCREEN_TEXT_ITEM1, // 16
    STATSCREEN_TEXT_ITEM2, // 17
    STATSCREEN_TEXT_ITEM3, // 18
    STATSCREEN_TEXT_ITEM4, // 19

    STATSCREEN_TEXT_BSRANGE, // 20
    STATSCREEN_TEXT_BSATKLABEL, // 21
    STATSCREEN_TEXT_BSHITLABEL, // 22
    STATSCREEN_TEXT_BSCRTLABEL, // 23
    STATSCREEN_TEXT_BSAVOLABEL, // 24

    STATSCREEN_TEXT_WEXP0, // 25
    STATSCREEN_TEXT_WEXP1, // 26
    STATSCREEN_TEXT_WEXP2, // 27
    STATSCREEN_TEXT_WEXP3, // 28

    STATSCREEN_TEXT_SUPPORT0, // 29
    STATSCREEN_TEXT_SUPPORT1, // 30
    STATSCREEN_TEXT_SUPPORT2, // 31
    STATSCREEN_TEXT_SUPPORT3, // 32
    STATSCREEN_TEXT_SUPPORT4, // 33

    STATSCREEN_TEXT_BWL, // 34

    STATSCREEN_TEXT_MAX
};

struct HelpBoxInfo;

struct StatScreenSt
{
    /* 00 */ u8 page;
    /* 01 */ u8 pageAmt;
    /* 02 */ u16 pageSlideKey; // 0, DPAD_RIGHT or DPAD_LEFT
    /* 04 */ short xDispOff; // Note: Always 0, not properly taked into account by most things
    /* 06 */ short yDispOff;
    /* 08 */ s8 inTransition;
    /* 0C */ struct Unit* unit;
    /* 10 */ struct MUProc* mu;
    /* 14 */ const struct HelpBoxInfo* help;
    /* 18 */ struct TextHandle text[STATSCREEN_TEXT_MAX];
};

enum
{
    HB_EXTINFO_NONE,
    HB_EXTINFO_WEAPON,
    HB_EXTINFO_STAFF,
    HB_EXTINFO_SAVEINFO,
};

struct HelpBoxProc
{
    /* 00 */ PROC_HEADER;

    /* 2C */ const struct HelpBoxInfo* info;

    /* 30 */ short xBox;
    /* 32 */ short yBox;
    /* 34 */ short wBox;
    /* 36 */ short hBox;
    /* 38 */ short xBoxInit;
    /* 3A */ short yBoxInit;
    /* 3C */ short xBoxFinal;
    /* 3E */ short yBoxFinal;
    /* 40 */ short wBoxInit;
    /* 42 */ short hBoxInit;
    /* 44 */ short wBoxFinal;
    /* 46 */ short hBoxFinal;
    /* 48 */ short timer;
    /* 4A */ short timerMax;

    /* 4C */ u16 mid;
    /* 4E */ u16 item;

    /* 50 */ u16 moveKey; // move ctrl proc only

    /* 52 */ u8 unk52;

    // NOTE: there's likely more, need to decompile more files
};

struct HelpBoxInfo
{
    /* 00 */ const struct HelpBoxInfo* adjUp;
    /* 04 */ const struct HelpBoxInfo* adjDown;
    /* 08 */ const struct HelpBoxInfo* adjLeft;
    /* 0C */ const struct HelpBoxInfo* adjRight;
    /* 10 */ u8 xDisplay;
    /* 11 */ u8 yDisplay;
    /* 12 */ u16 mid;
    /* 14 */ void(*redirect)(struct HelpBoxProc* proc);
    /* 18 */ void(*populate)(struct HelpBoxProc* proc);
};

int GetLastStatScreenUid(void);
void SetLastStatScreenUid(int uid);
void SetStatScreenConfig(int unk);
void StartStatScreen(struct Unit* unit, ProcPtr parent);

void HbPopulate_SSItem(struct HelpBoxProc* proc);
void HbPopulate_SSStatus(struct HelpBoxProc* proc);
void HbPopulate_SSPower(struct HelpBoxProc* proc);
void HbRedirect_SSItem(struct HelpBoxProc* proc);
void HbPopulate_SSWExp(struct HelpBoxProc* proc);
void HbPopulate_SSCharacter(struct HelpBoxProc* proc);
void HbPopulate_SSClass(struct HelpBoxProc* proc);
void HbRedirect_SSSupports(struct HelpBoxProc* proc);

// static
void UpdateHelpBoxDisplay(struct HelpBoxProc* proc, int arg1);

void StartHelpBox(int x, int y, int mid);
void StartHelpBox_Unk(int x, int y, int mid);
void StartItemHelpBox(int x, int y, int item);
void StartHelpBoxExt(const struct HelpBoxInfo* info, int unk);
void StartHelpBoxExt_Unk(int x, int y, int mid);
void CloseHelpBox(void);
void EndHelpBox(void);
void StartMovingHelpBox(const struct HelpBoxInfo* info, struct Proc* parent);
void StartMovingHelpBoxExt(const struct HelpBoxInfo* info, struct Proc* parent, int x, int y);

// static
void SetHelpBoxInitPosition(struct HelpBoxProc* proc, int x, int y);
void ResetHelpBoxInitSize(struct HelpBoxProc* proc);
int GetHelpBoxItemInfoKind(int item);

int TryRelocateHbUp(struct HelpBoxProc* proc);
int TryRelocateHbDown(struct HelpBoxProc* proc);
int TryRelocateHbLeft(struct HelpBoxProc* proc);
int TryRelocateHbRight(struct HelpBoxProc* proc);

int StartLockingHelpBox_Unused(int mid, ProcPtr parent);

struct Proc* StartHelpPromptSprite_Unused(int x, int y, ProcPtr parent);
struct Proc* StartHelpPromptSprite(int x, int y, int palid, ProcPtr parent);
struct Proc* StartHelpPromptSprite_Unused2(int x, int y, ProcPtr parent);
void EndHelpPromptSprite(void);
void MoveHelpPromptSprite(int x, int y);

const struct HelpBoxInfo* GetLastHelpBoxInfo(void);

extern struct HelpBoxInfo CONST_DATA gHelpInfo_Ss0Pow; // page 0 root help
extern struct HelpBoxInfo CONST_DATA gHelpInfo_Ss1CharName; // hardcoded thing bad
extern struct HelpBoxInfo CONST_DATA gHelpInfo_Ss1Item0; // page 1 root help
extern struct HelpBoxInfo CONST_DATA gHelpInfo_Ss2Rank0; // page 2 root help

#endif // GUARD_STATSCREEN_H
