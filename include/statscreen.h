#ifndef GUARD_STATSCREEN_H
#define GUARD_STATSCREEN_H

enum
{
    STATSCREEN_BGPAL_HALO = 1,
    STATSCREEN_BGPAL_2 = 2,
    STATSCREEN_BGPAL_3 = 3,
    STATSCREEN_BGPAL_ITEMICONS = 4,
    STATSCREEN_BGPAL_EXTICONS = 5,
    STATSCREEN_BGPAL_6 = 6,
    STATSCREEN_BGPAL_7 = 7,
    STATSCREEN_BGPAL_FACE = 11,
    STATSCREEN_BGPAL_BACKGROUND = 12, // 4 palettes

    STATSCREEN_OBJPAL_4 = 4,
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

struct StatScreenEffectProc
{
    PROC_HEADER;

    /* 29 */ u8 pad29[0x38 - 0x29];

    /* 38 */ int direction;
    /* 3C */ int yDispInit;
    /* 40 */ int yDispFinal;

    /* 44 */ u8 pad44[0x4A - 0x44];

    /* 4A */ short newItem; // page or unit depending on slide
    /* 4C */ short timer;
    /* 4E */ short blendDirection;

    /* 50 */ u8 pad50[0x52 - 0x50];

    /* 52 */ u16   key;
};

struct StatScreenPageNameProc
{
    /* 00 */ PROC_HEADER;

    // Page Num Sprite Control proc only
    /* 2A */ short xLeftCursor;
    /* 2C */ short xRightCursor;
    /* 2E */ u16 animTimerLeft;
    /* 30 */ u16 animTimerRight;
    /* 32 */ short animSpeedLeft;
    /* 34 */ short animSpeedRight;

    // Page Name Sprite Control proc only
    /* 36 */ u8 pageNum;
    /* 38 */ short yScale; // 6 == times 1
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

struct HelpPromptObjectProc
{
    PROC_HEADER;

    /* 2C */ int xDisplay;
    /* 30 */ int yDisplay;
    /* 34 */ int tileref;
};

int GetSomeUnitId(void);
void sub_8086DD8(int uid);
void sub_8086DE4(int unk);
void sub_8086DF0(void);
void sub_8086E44(void);
void sub_8086FAC(void);
void DrawStatScreenBar(int num, int x, int y, int base, int total, int max);
void DrawUnitStatScreen(void);
void DrawUnitItemScreen(void);
void DrawUnitScreenSupportList(void);
void DrawUnitWeaponRank(int num, int x, int y, int wtype);
void DrawUnitWeaponScreen(void);
void sub_80878CC(int pageid);
struct Unit* sub_8087920(struct Unit* u, int direction);
void sub_80879DC(struct StatScreenEffectProc* proc);
void sub_8087ACC(void);
void sub_8087AD8(u16 config, int newPage, struct Proc* parent);
void sub_8087B40(struct StatScreenEffectProc* proc);
void sub_8087BA0(struct StatScreenEffectProc* proc);
void sub_8087BF0(void);
void sub_8087C04(void);
void sub_8087C34(struct StatScreenEffectProc* proc);
void sub_8087CC0(struct StatScreenEffectProc* proc);
void sub_8087D24(struct StatScreenEffectProc* proc);
void sub_8087D98(struct StatScreenEffectProc* proc);
void sub_8087DF8(struct StatScreenEffectProc* proc);
void sub_8087E28(struct Proc* proc);
void sub_8087E7C(struct Unit* unit, int direction, struct Proc* parent);
void sub_8087EB8(int pageid);
void sub_8087F48(struct StatScreenPageNameProc* proc);
void sub_8087FE0(struct StatScreenPageNameProc* proc);
void sub_8088014(struct StatScreenPageNameProc* proc);
void sub_80880DC(struct StatScreenPageNameProc* proc);
void sub_80881AC(struct StatScreenPageNameProc* proc);
void sub_80881C4(struct StatScreenPageNameProc* proc);
void sub_80881FC(struct StatScreenPageNameProc* proc);
void sub_80882E4(void);
void sub_8088354(void);
void sub_8088384(void);
void sub_808844C(void);
void sub_80884B0(struct Proc* proc);
void sub_8088670(struct Proc* proc);
void sub_808873C(struct Proc* proc);
void sub_80888B4(void);
void sub_808890C(void);
void sub_8088920(void);
void sub_808894C(struct Unit* unit, struct Proc* parent);
void MakeStatScreenRText6C(int pageid, struct Proc* proc);
void sub_8088A00(struct HelpBoxProc* proc);
void sub_8088A2C(struct HelpBoxProc* proc);
void sub_8088B08(struct HelpBoxProc* proc);
void sub_8088B40(struct HelpBoxProc* proc);
void sub_8088B94(struct HelpBoxProc* proc);
void sub_8088BD4(struct HelpBoxProc* proc);
void sub_8088C00(struct HelpBoxProc* proc);
void sub_8088C14(struct HelpBoxProc* proc);
void sub_8088C48(struct HelpBoxProc* proc, int arg1);
void sub_8088CFC(struct HelpBoxProc* proc);
void sub_8088D3C(struct HelpBoxProc* proc);
void sub_8088D64(struct HelpBoxProc* proc);
void sub_8088DB8(struct HelpBoxProc* proc);
void sub_8088DE0(int x, int y, int mid);
void sub_8088E14(int x, int y, int mid);
void sub_8088E60(int x, int y, int item);
void sub_8088E9C(const struct HelpBoxInfo* info, int unk);
void sub_8088F68(int x, int y, int mid);
void sub_8089018(void);
void sub_8089018(void);
void sub_808903C(void);
void sub_8089060(struct HelpBoxProc* proc);
void sub_8089088(struct HelpBoxProc* proc);
void sub_8089150(struct HelpBoxProc* proc);
void Create6CRText(const struct HelpBoxInfo* helpinfo, struct Proc* parent);
void sub_8089188(const struct HelpBoxInfo* info, struct Proc* parent, int x, int y);
void sub_80891AC(struct HelpBoxProc* proc, int width, int height);
void sub_8089210(struct HelpBoxProc* proc, int x, int y);
void sub_808929C(struct HelpBoxProc* proc, int x, int y);
void sub_80892C0(struct HelpBoxProc* proc);
int sub_80892D0(int item);
void sub_8089320(struct HelpBoxProc* proc);
int sub_8089354(struct HelpBoxProc* proc);
int sub_8089384(struct HelpBoxProc* proc);
int sub_80893B4(struct HelpBoxProc* proc);
int sub_80893E4(struct HelpBoxProc* proc);
void sub_8089430(struct Proc* proc);
int sub_8089454(int mid, struct Proc* parent);
void Loop6C_8A00B20_UpdateOAMData(struct HelpPromptObjectProc* proc);
struct Proc* sub_80894AC(int x, int y, struct Proc* parent);
struct Proc* sub_80894E0(int x, int y, int palid, struct Proc* parent);
struct Proc* sub_808953C(int x, int y, struct Proc* parent);
void sub_8089570(void);
void sub_8089588(int x, int y);
const struct HelpBoxInfo* sub_80895A8(void);

#endif // GUARD_STATSCREEN_H
