#include "global.h"

enum promohandler_bmtype
{
    PROMO_HANDLER_TYPE_TRANINEE,
    PROMO_HANDLER_TYPE_BM,
    PROMO_HANDLER_TYPE_PREP,
};

enum promohandler_stat
{
    PROMO_HANDLER_STAT_INIT,
    PROMO_HANDLER_STAT_IDLE,
    PROMO_HANDLER_STAT_END,
};

struct ProcPromoHandler
{
    PROC_HEADER;
    ProcPtr promo_main;
    u8 stat;
    u8 bmtype;
    s8 u32;
    u8 pid;
    u8 sel_en;
    s8 jid;
    struct Unit *unit;
    s32 item_slot;
    u32 u40;
    u32 _u44;
    u32 _u48;
    u8 u4c;
    struct MenuProc* u50;
};

enum promomain_proc_label {
    PROMOMAIN_LABEL_START,
    PROMOMAIN_LABEL_1,
    PROMOMAIN_LABEL_TRAINEE,
    PROMOMAIN_LABEL_3,
    PROMOMAIN_LABEL_SEL_EN,
    PROMOMAIN_LABEL_POST_SEL,
};

enum promomain_stat
{
    PROMO_MAIN_STAT_INIT = 0,
    PROMO_MAIN_STAT_SELECTION,
    PROMO_MAIN_STAT_2,

    PROMO_MAIN_STAT_TRAINEE_EVENT = 0xFF,
};

/* Seems like there are a couple of proc structures going on here */
struct ProcPromoMain
{
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

struct ProcPromoSel
{
    PROC_HEADER;
    s8 _u29;
    s8 _u2a;
    s8 _u2b;
    u16 u2c[3];
    u16 u32[3];
    s16 msg_desc[3];
    u16 _u3e;
    u8 u40;
    u8 menu_index;
    u16 pid;
    u16 u44;
    u8 u46;
    u8 u47;
    u16 u48;
    u8 u4a[3];
    u8 _u4d[3];
    u32 u50;
    ProcPtr menu_proc;
    /* ... more maybe */
};

struct ProcPromoTraineeEvent
{
    PROC_HEADER;
    s8 _u29;
    u16 pid;
    u16 _u2c;
    u8 face;
    u8 _u2f;
    ProcPtr u30;
};

void MakePromotionScreen(struct ProcPromoHandler *proc, u8 pid, u8 terrain);

extern struct ProcCmd ProcScr_PromoMain[];
