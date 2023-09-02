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
    s8 _u29;
    s8 _u2a;
    s8 _u2b;
    u16 jid[3];
    u16 sprite[3];
    s16 msg_desc[3];
    u16 _u3e;
    u8 stat;
    u8 menu_index;
    u16 pid;
    u16 u44;
    u8 u46;
    u8 u47;
    u16 weapon;
    u8 use_wpn[3];
    u8 _u4d[3];
    u32 u50;
    ProcPtr menu_proc;
    /* ... more maybe */
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
void ClassChgLoadEfxTerrain(void);
void ClassChgLoadUI(void);
// ??? ClassChgSelDrawPidName(???);
bool Check3rdTraineeEnabled(void);
void RegisterTsaWithOffset(u16 *_dst, u16 *_src, u32 offset);
ProcPtr StartPromoClassSelect(ProcPtr parent);
// ??? NewClassChgMenuSelect(???);
// ??? sub_80CCF60(???);
// ??? LoadBattleSpritesForBranchScreen(???);
// ??? sub_80CD1D4(???);
// ??? PrepClassChgOnCancel(???);
// ??? sub_80CD294(???);
// ??? sub_80CD2CC(???);
// ??? StartAndWaitPromoSelect(???);
// ??? sub_80CD330(???);
void sub_80CD34C(void);
void sub_80CD408(u32, s16, s16);
void sub_80CD47C(int, int, int, int, int);
u8 LoadClassBattleSprite(s16*, u16, u16);
// ??? NewCcramifyEnd(???);
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
