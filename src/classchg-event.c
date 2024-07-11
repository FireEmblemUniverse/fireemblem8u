#include "global.h"
#include "hardware.h"
#include "mu.h"
#include "face.h"
#include "proc.h"
#include "bmio.h"
#include "bmmap.h"
#include "bmudisp.h"
#include "uiutils.h"
#include "scene.h"
#include "bm.h"
#include "ap.h"
#include "bmlib.h"
#include "cgtext.h"
#include "constants/characters.h"
#include "classchg.h"

void sub_80CD62C(void)
{
    BMapDispResume();
    RefreshBMapGraphics();
    RefreshEntityBmMaps();
    MU_EndAll();
    StartMu(gActiveUnit);
    RenderBmMap();
    RefreshUnitSprites();
}

CONST_DATA struct ProcCmd ProcScr_PromoSelectEvent[] = {
    PROC_SLEEP(8),
	PROC_NAME("ccramify_event"),
    PROC_LABEL(0),
    PROC_CALL(PromoTrainee_InitScreen),
    PROC_LABEL(1),
    PROC_CALL(StartMidFadeFromBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(PromoTrainee_Talk1),
    PROC_WHILE(CgTextExists),
    PROC_CALL(PromoTrainee_Talk2),
    PROC_WHILE(CgTextExists),
    PROC_CALL(PromoTrainee_Talk3),
    PROC_WHILE(CgTextExists),
    PROC_CALL(PromoTrainee_Talk4),
    PROC_WHILE(CgTextExists),
    PROC_CALL(PromoTrainee_Talk5),
    PROC_WHILE(CgTextExists),
    PROC_LABEL(3),
    PROC_WHILE(RemovePromoTraineeEventFace),
    PROC_LABEL(2),
    PROC_CALL(PromoTrainee_OnEnd),
    PROC_LABEL(4),
    PROC_END,
};

void PromoMain_SetupTraineeEvent(struct ProcPromoMain *proc)
{
    proc->priv = (u32)StartPromoTraineeEvent(proc);
}

ProcPtr StartPromoTraineeEvent(ProcPtr proc)
{
    return Proc_StartBlocking(ProcScr_PromoSelectEvent, proc);
}

bool RemovePromoTraineeEventFace(void)
{
    u16 start = gFaces[0]->xPos;
    s16 cmp = start;

    if (cmp > 0x150) {
        return 0;
    } else {
        struct FaceProc *b = gFaces[1];
        struct FaceProc *c = gFaces[2];
        struct FaceProc *d = gFaces[3];
        gFaces[0]->xPos = start + 4;
        d->xPos = start + 4;
        c->xPos = start + 4;
        b->xPos = start + 4;

        return 1;
    }
}

void PromoTrainee_InitScreen(struct ProcPromoTraineeEvent *proc)
{
    struct ProcPromoMain *parent = proc->proc_parent;
    struct Unit *unit;
    proc->pid = parent->pid;
    unit = GetUnitFromCharId(proc->pid);
    if (unit)
        proc->face = unit->pCharacterData->portraitId;
    else
        proc->face = 0;

    ResetFaces();
    ResetText();
    LoadUiFrameGraphics();
    LoadObjUIGfx();
    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 3;
    BG_EnableSyncByMask(2);
    RestartMuralBackground();
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(0xf);

    SetDispEnable(1, 0, 0, 1, 1);
    InitTalk(0x200, 3, 1);
    SetBlendConfig(1, 14, 8, 0);
    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);
}

void PromoTrainee_OnEnd(struct ProcPromoTraineeEvent *proc)
{
    struct ProcPromoMain *parent = proc->proc_parent;
    parent->stat = PROMO_MAIN_STAT_TRAINEE_EVENT;
    ResetDialogueScreen();
    EndPrepSpecialCharEffect();
    APProc_DeleteAll();
    EndMuralBackground_();
    BG_SetPosition(1, 0, 0);
    BG_SetPosition(2, 0, 0);
    BG_SetPosition(4, 0, 0);
    BG_SetPosition(8, 0, 0);
    BG_EnableSyncByMask(15);
    SetDispEnable(1, 1, 1, 1, 1);
}

void PromoTrainee_Talk1(struct ProcPromoTraineeEvent *proc)
{
    struct FaceProc *b, *c, *d;
    u8 i;

    const u32 msgs[3] = { 
        0xC44,  /* [ToggleSmile]Wow... Would you look at[NL]these muscles![A][ToggleSmile] */
        0xC48,  /* [ToggleSmile]I'm ready to fight now![.][A][ToggleSmile] */
        0xC4D   /* [ToggleSmile]Oh, my... Look at this![.][A][ToggleSmile] */
    };

    switch (proc->pid) {
    case CHARACTER_AMELIA:
        i = 1;
        break;

    case CHARACTER_EWAN:
        i = 2;
        break;

    case CHARACTER_ROSS:
    default:
        i = 0;
        break;
    }
    StartTalkFace(proc->face, 0xd4, 0x50, 0x82, 0);

    StartCgText(0x16, 0x12, 0x12, 4, msgs[i], OBJ_VRAM0 + 0x1800, -1, 0);
    SetCgTextFlags(CG_TEXT_FLAG_1 | CG_TEXT_FLAG_3);

    gFaces[0]->displayBits = FACE_DISP_KIND(2) | FACE_DISP_HLAYER(2);
    b = gFaces[1];
    c = gFaces[2];
    d = gFaces[3];
    d->displayBits = FACE_DISP_BIT_14;
    c->displayBits = FACE_DISP_BIT_14;
    b->displayBits = FACE_DISP_BIT_14;

    gUnknown_03005398 = -1;
}

void PromoTrainee_Talk2(struct ProcPromoTraineeEvent *proc)
{
    u8 i;

    const u32 msgs[3] = {
        0xC45,  /* [ToggleSmile]I had no idea how much[NL]stronger I'd gotten...[A][ToggleSmile] */
        0xC49,  /* [ToggleSmile]This armor used to be too[.][NL]heavy for me to wear...[.][A][ToggleSmile] */
        0xC4E   /* [ToggleSmile]Magic used to seem so hard,[.][NL]but I...I think I've got it.[A][ToggleSmile] */
    };

    switch (proc->pid) {
    case CHARACTER_AMELIA:
        i = 1;
        break;

    case CHARACTER_EWAN:
        i = 2;
        break;

    case CHARACTER_ROSS:
    default:
        i = 0;
        break;
    }

    StartCgText(0x16, 0x12, 0x12, 4, msgs[i], OBJ_VRAM0 + 0x1800, -1, 0);
    SetCgTextFlags(CG_TEXT_FLAG_1 | CG_TEXT_FLAG_3);
}

void PromoTrainee_Talk3(struct ProcPromoTraineeEvent *proc)
{
    u8 i;

    const u32 msgs[3] = {
        0xC46,  /* [ToggleSmile]Why, I bet I could take on my[.][NL]dad or just about anyone![.][A][ToggleSmile] */
        0xC4A,  /* [ToggleSmile]But now, it's no problem![.][NL]I've come a long way.[.][A][ToggleSmile] */
        0xC4F   /* [ToggleSmile]I've turned a corner in my[NL]education. I'm a real mage![.][A][ToggleSmile] */
    };

    switch (proc->pid) {
    case CHARACTER_AMELIA:
        i = 1;
        break;

    case CHARACTER_EWAN:
        i = 2;
        break;

    case CHARACTER_ROSS:
    default:
        i = 0;
        break;
    }

    StartCgText(0x16, 0x12, 0x12, 4, msgs[i], OBJ_VRAM0 + 0x1800, -1, 0);
    SetCgTextFlags(CG_TEXT_FLAG_1 | CG_TEXT_FLAG_3);
}

void PromoTrainee_Talk4(struct ProcPromoTraineeEvent *proc)
{
    u8 i;

    const u32 msgs[3] = {
        0xC47,  /* [ToggleSmile]I knew if I worked at it, I'd[.][NL]become a great warrior![.][A][ToggleSmile] */
        0xC4B,  /* [ToggleSmile]That's right. I'm a real[NL]soldier now![A][ToggleSmile] */
        0xC50   /* [ToggleSmile]But I'm not going to stop[.][NL]studying...[.][A][ToggleSmile] */
    };

    switch (proc->pid) {
    case CHARACTER_AMELIA:
        i = 1;
        break;

    case CHARACTER_EWAN:
        i = 2;
        break;

    case CHARACTER_ROSS:
    default:
        i = 0;
        break;
    }

    StartCgText(0x16, 0x12, 0x12, 4, msgs[i], OBJ_VRAM0 + 0x1800, -1, 0);
    SetCgTextFlags(CG_TEXT_FLAG_1 | CG_TEXT_FLAG_3);
}

void PromoTrainee_Talk5(struct ProcPromoTraineeEvent *proc) {
    u8 i;

    const u32 msgs[3] = {
        -1,
        0xC4C,  /* [ToggleSmile]But I'm not about to stop.[NL]I'm just getting started![.][A][ToggleSmile] */
        0xC51   /* [ToggleSmile]Not until I've become a[.][NL]great sage, like my teacher.[A][ToggleSmile] */
    };

    switch (proc->pid) {
    case CHARACTER_AMELIA:
        i = 1;
        break;

    case CHARACTER_EWAN:
        i = 2;
        break;

    case CHARACTER_ROSS:
    default:
        i = 0;
        break;
    }

    if (msgs[i] == (u32)-1) {
        Proc_Goto(proc, 3);
        return;
    }
    else {
        StartCgText(0x16, 0x12, 0x12, 4, msgs[i], OBJ_VRAM0 + 0x1800, -1, 0);
        SetCgTextFlags(CG_TEXT_FLAG_1 | CG_TEXT_FLAG_3);
    }
}

int PromoMain_SetupTraineeEvent_(struct ProcPromoMain *proc) {
    PromoMain_SetupTraineeEvent(proc);
    return 0;
}

bool PromoTraineeEventExists(struct ProcPromoMain *proc) {
    if (proc->stat == PROMO_MAIN_STAT_TRAINEE_EVENT)
        return false;
    else
        return true;
}
