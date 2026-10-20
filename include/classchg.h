#pragma once

#include "global.h"
#include "prepscreen.h"
#include "uimenu.h"

enum promohandler_proc_label {
    PROMO_HANDLER_LABEL_REINIT,
    PROMO_HANDLER_LABEL_IDLE,
    PROMO_HANDLER_LABEL_END,
};

enum promohandler_bmtype {
    PROMO_HANDLER_TYPE_TRANINEE,
    PROMO_HANDLER_TYPE_BM,
    PROMO_HANDLER_TYPE_PREP,
};

enum promohandler_stat {
    PROMO_HANDLER_STAT_INIT,
    PROMO_HANDLER_STAT_IDLE,
    PROMO_HANDLER_STAT_END,
};

struct ProcPromoHandler {
    PROC_HEADER;
    /* 2C */ ProcPtr promo_main;
    /* 30 */ u8 stat;
    /* 31 */ u8 bmtype;
    /* 32 */ s8 u32;
    /* 33 */ u8 pid;
    /* 34 */ u8 sel_en;
    /* 35 */ s8 jid;
    /* 38 */ struct Unit *unit;
    /* 3C */ s32 item_slot;
    /* 40 */ u32 game_lock;
    /* 44 */ u32 _u44;
    /* 48 */ u32 _u48;
    /* 4C */ u8 u4c;
    /* 50 */ struct MenuProc* u50;
};

enum promomain_proc_label {
    PROMOMAIN_LABEL_START,
    PROMOMAIN_LABEL_1,
    PROMOMAIN_LABEL_TRAINEE,
    PROMOMAIN_LABEL_3,
    PROMOMAIN_LABEL_SEL_EN,
    PROMOMAIN_LABEL_POST_SEL,
};

enum promomain_stat {
    PROMO_MAIN_STAT_INIT = 0,
    PROMO_MAIN_STAT_SELECTION,
    PROMO_MAIN_STAT_2,

    PROMO_MAIN_STAT_TRAINEE_EVENT = 0xFF,
};

/* Seems like there are a couple of proc structures going on here */
struct ProcPromoMain {
    PROC_HEADER;
    u8 stat;
    struct Unit *unit;
    u32 priv;
    ProcPtr sel_en;
    u8 pid;
    u8 terrain;
    s8 _u3a;
    s8 jid;
};

enum classchg_proc_label {
    PROC_CLASSCHG_SEL_INIT,
    PROC_CLASSCHG_SEL_1,
    PROC_CLASSCHG_SEL_2,
    PROC_CLASSCHG_SEL_END1,
    PROC_CLASSCHG_SEL_4,
    PROC_CLASSCHG_SEL_END2
};

struct ProcPromoSel {
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x2C);

    /* 2C */ u16 jid[3];
    /* 32 */ u16 sprite[3];
    /* 38 */ s16 msg_desc[3];

    /* 3E */ STRUCT_PAD(0x3E, 0x40);

    /* 40 */ u8 stat;
    /* 41 */ u8 main_select;
    /* 42 */ u16 pid;
    /* 44 */ u16 timer;
    /* 46 */ u8 name_width;
    /* 47 */ u8 name_x;
    /* 48 */ u16 weapon;
    /* 4A */ u8 use_wpn[3];

    /* 4D */ STRUCT_PAD(0x4D, 0x50);

    /* 50 */ u32 terrain;
    /* 54 */ ProcPtr menu_proc;
};

struct ProcPromoTraineeEvent {
    PROC_HEADER;
    s8 _u29;
    u16 pid;
    u16 _u2c;
    u8 face;
    u8 _u2f;
    ProcPtr u30;
};

struct ProcClassChgMenuSel {
    PROC_HEADER;
    STRUCT_PAD(0x29, 0x4C);
    u8 unk4C;
    struct MenuProc* pmenu;
};

struct ProcClassChgPostConfirm {
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 game_lock;
};

// extern ??? ProcScr_PromoMain
// extern ??? ProcScr_PromoHandler
extern CONST_DATA struct ProcCmd ProcScr_PromoSelect[];
extern CONST_DATA struct ProcCmd ProcScr_PromoSelectEnd[];
extern CONST_DATA struct ProcCmd ProcScr_PromoSelectEvent[];
extern CONST_DATA struct MenuDef Menu_PromoSubConfirm;
extern CONST_DATA struct MenuDef gMenuDef_PromoSel;
extern CONST_DATA struct ProcCmd ProcScr_ClassChgMenuSel[];
// extern ??? ClassChgMenuRect
extern CONST_DATA struct ProcCmd ProcScr_ClassChgReal[];

// ??? MakePromotionScreen(???);
// ??? Make6C_PromotionMain(???);
void PromoMain_InitScreen(struct ProcPromoMain *proc);
void PromoMain_HandleType(struct ProcPromoMain *proc);
void PromoHandleTraineePostType(struct ProcPromoMain *proc);
void PromoMain_HandlePrepEndEffect(struct ProcPromoMain *proc);
void PromoMain_OnEnd(struct ProcPromoMain *proc);
u32 PromoHandler_SetupAndStartUI(struct ProcPromoHandler *proc);
u8 PromoHandler_SetInitStat(struct ProcPromoHandler *proc);
void PromoHandlerIdle(struct ProcPromoHandler *proc);
void StartTraineePromoScreen(ProcPtr parent);
void StartPrepScreenPromotion(struct ProcPrepItemUse *proc);
void StartBmPromotion(ProcPtr);
void ChangeClassDescription(u32 msg);
void LoadClassReelFontPalette(struct ProcPromoSel *proc, int class_id);
void LoadClassNameInClassReelFont(struct ProcPromoSel *proc);
void ClassChgEndEkrPreview(void);
void ClassChgLoadUI(void);
void ClassChgSel_DrawClassNames(struct ProcPromoSel *proc);
bool Check3rdTraineeEnabled(void);
void RegisterTsaWithOffset(u16 *_dst, u16 *_src, u32 offset);
ProcPtr StartPromoClassSelect(ProcPtr parent);
void PromoSel_Init(struct ProcPromoSel *proc);
void PromoSel_StartClassDesc(struct ProcPromoSel *proc);
void PromoSel_Loop(struct ProcPromoSel *proc);
void PromoSel_EndOnMap(struct ProcPromoSel *proc);
void PromoSel_OnPrepCancel(struct ProcPromoSel *proc);
void PromoSel_RoutePreEnd(struct ProcPromoSel *proc);
void PromoSel_RouteOnEnd(struct ProcPromoSel *proc);
bool StartAndWaitPromoSelect(struct ProcPromoMain *proc);
bool PromoMain_WaitSelection(struct ProcPromoMain *proc);
void ClassChgMagi_ResetBlend(void);
void ClassChg_InitTerrainfx(u32 terrain, s16 x, s16 y);
void ClassChg_InitMainMini(int bid, int char_pal, int x, int y, int round_type);
u8 LoadClassBattleSprite(s16*, u16, u16);
void StartPromoSelectEnd(void);
// ??? sub_80CD62C(???);
void PromoMain_SetupTraineeEvent(struct ProcPromoMain *proc);
ProcPtr StartPromoTraineeEvent(ProcPtr proc);
bool RemovePromoTraineeEventFace(void);
void PromoTrainee_InitScreen(struct ProcPromoTraineeEvent *proc);
void PromoTrainee_OnEnd(struct ProcPromoTraineeEvent *proc);
void PromoTrainee_Talk1(struct ProcPromoTraineeEvent *proc);
void PromoTrainee_Talk2(struct ProcPromoTraineeEvent *proc);
void PromoTrainee_Talk3(struct ProcPromoTraineeEvent *proc);
void PromoTrainee_Talk4(struct ProcPromoTraineeEvent *proc);
void PromoTrainee_Talk5(struct ProcPromoTraineeEvent *proc);
// ??? PromoMain_SetupTraineeEvent_(???);
// ??? PromoTraineeEventExists(???);
void sub_80CDA4C(struct MenuProc *proc);
// ??? PromoSubConfirm_OnInit(???);
// ??? PromoSubConfirm_OnEnd(???);
// ??? PromoSubConfirmMenuOnSelect(???);
// ??? ClassChgMenuSel_OnBPress(???);
// ??? ClassChgMenuSelOnInit(???);
// ??? ClassChgMenuSelOnEnd(???);
// ??? ClassChgMenuItem_OnSelect(???);
// ??? ClassChgMenuSelOnPressB(???);
void ClassChgMenuOnDrawCore(struct MenuProc *a, struct MenuItemProc *b, char *c);
// ??? ClassChgMenuItem_OnTextDraw(???);
// ??? ClassChgMenuItem_OnChange(???);
// ??? ClassChgMenuItem_3rdUsability(???);
void ClassChgMenuExec(struct ProcClassChgMenuSel *proc);
void nullsub_80CDDD4(void);
void nullsub_61(void);
ProcPtr NewClassChgMenuSelect(ProcPtr);
void ClassChgExecPromotionReal(struct ProcClassChgPostConfirm *proc);
void ClassChgPostConfirmWaitBanimEnd(struct ProcClassChgPostConfirm *proc);
void sub_80CDE98(struct ProcClassChgPostConfirm *proc);
void ExecClassChgReal(struct ProcPromoMain *proc);
void MakePromotionScreen(struct ProcPromoHandler *proc, u8 pid, u8 terrain);

extern struct ProcCmd ProcScr_PromoMain[];
