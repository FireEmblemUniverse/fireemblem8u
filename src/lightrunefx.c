#include "global.h"
#include "functions.h"
#include "variables.h"
#include "constants/video-global.h"
#include "proc.h"
#include "hardware.h"
#include "soundwrapper.h"


/**
 * The effect that plays when putting down a light rune
 */



/* struct definitions */

struct ProcMapEffectAnimFx {
    PROC_HEADER;

    /* 29 */ u8 _pad_29[0x4C - 0x29];

    /* 4C */ s16 counter;
};


/* function declarations */
void ProcLightRuneAnim_Init(struct ProcMapEffectAnimFx *proc);
void ProcLightRuneAnim_Loop(struct ProcMapEffectAnimFx *proc);
void ProcLightRuneAnim_End(struct ProcMapEffectAnimFx *proc);

void ProcLightRuneAnim2_Init(struct ProcMapEffectAnimFx *proc);
void ProcLightRuneAnim2_Loop(struct ProcMapEffectAnimFx *proc);
void ProcLightRuneAnim2_End(struct ProcMapEffectAnimFx *proc);

void ProcLightRuneAnim3_Init(struct ProcMapEffectAnimFx *proc);
void ProcLightRuneAnim3_Loop(struct ProcMapEffectAnimFx *proc);
void ProcLightRuneAnim3_End(struct ProcMapEffectAnimFx *proc);


/* section.rodata */
const u8 Vectors_LightRune[0x34] = {
    0x00, 0x00,   0x00, 0x00,   0x08, 0x00,   0x00, 0x00,
    0x10, 0x00,   0x00, 0x00,   0x18, 0x00,   0x00, 0x00,

    0x00, 0x09,   0x00, 0x00,   0x08, 0x09,   0x00, 0x00,
    0x10, 0x09,   0x00, 0x00,   0x18, 0x09,   0x00, 0x00,

    0x00, 0x12,   0x00, 0x00,   0x08, 0x12,   0x00, 0x00,
    0x10, 0x12,   0x00, 0x00,   0x18, 0x12,   0x00, 0x00,

    0xFF, 0xFF,   0x00, 0x00
};

const u8 Vectors_LightRune2[0x34] = {
    0x00, 0x00,   0x00, 0x00,   0x08, 0x00,   0x00, 0x00,
    0x10, 0x00,   0x00, 0x00,   0x18, 0x00,   0x00, 0x00,

    0x00, 0x09,   0x00, 0x00,   0x08, 0x09,   0x00, 0x00,
    0x10, 0x09,   0x00, 0x00,   0x18, 0x09,   0x00, 0x00,

    0x00, 0x12,   0x00, 0x00,   0x08, 0x12,   0x00, 0x00,
    0x10, 0x12,   0x00, 0x00,   0x18, 0x12,   0x00, 0x00,

    0xFF, 0xFF,   0x00, 0x00
};

const u8 Vectors_LightRune3[0x34] = {
    0x00, 0x00,   0x00, 0x00,   0x08, 0x00,   0x00, 0x00,
    0x10, 0x00,   0x00, 0x00,   0x18, 0x00,   0x00, 0x00,

    0x00, 0x09,   0x00, 0x00,   0x08, 0x09,   0x00, 0x00,
    0x10, 0x09,   0x00, 0x00,   0x18, 0x09,   0x00, 0x00,

    0x00, 0x12,   0x00, 0x00,   0x08, 0x12,   0x00, 0x00,
    0x10, 0x12,   0x00, 0x00,   0x18, 0x12,   0x00, 0x00,

    0xFF, 0xFF,   0x00, 0x00
};


/* section.data */
struct ProcCmd CONST_DATA ProcScr_LightRuneAnim[] = {
    PROC_CALL(ProcLightRuneAnim_Init),
    PROC_REPEAT(ProcLightRuneAnim_Loop),
    PROC_CALL(ProcLightRuneAnim_End),
    PROC_END
};

struct ProcCmd CONST_DATA ProcScr_LightRuneAnim2[] = {
    PROC_CALL(ProcLightRuneAnim2_Init),
    PROC_REPEAT(ProcLightRuneAnim2_Loop),
    PROC_CALL(ProcLightRuneAnim2_End),
    PROC_END
};

struct ProcCmd CONST_DATA ProcScr_LightRuneAnim3[] = {
    PROC_CALL(ProcLightRuneAnim2_Init),     /* although unused, but I think this is a bug... */
    PROC_REPEAT(ProcLightRuneAnim2_Loop),
    PROC_CALL(ProcLightRuneAnim2_End),
    PROC_END
};


/* section.text */

void ProcLightRuneAnim_Init(struct ProcMapEffectAnimFx *proc)
{
    int i;

    CopyDataWithPossibleUncomp(Img_LightRune, BG_CHR_ADDR(BGCHR_LIGHTRUNE_IMG));
    ApplyPalette(Pal_LightRune, BGPAL_LIGHTRUNE_IMG);
    CopyDataWithPossibleUncomp(Tsa_LightRune, gBmFrameTmap0);

    for (i = 0; i < 0x360; i++)
        gBmFrameTmap0[i] += TILEREF(BGCHR_LIGHTRUNE_IMG, BGPAL_LIGHTRUNE_IMG);

    BG_Fill(gBG0TilemapBuffer, TILEREF(BGCHR_LIGHTRUNE_IMG, 0));
    BG_EnableSyncByMask(BG0_SYNC_BIT);
    PlaySoundEffect(0x2D8);

    SetSpecialColorEffectsParameters(0x1, 0x10, 0x10, 0x0);
    SetBlendTargetA(1, 0, 0, 0, 0);
    SetBlendTargetB(0, 1, 1, 1, 1);

    proc->counter = 0;
}

void ProcLightRuneAnim_Loop(struct ProcMapEffectAnimFx *proc)
{
    u8 buf[0x34];
    u8 *pbuf;
    int index;
    int x, y;

    memcpy(buf, Vectors_LightRune, 0x34);
    proc->counter++;

    index = (proc->counter / 3);
    index = (index << 0x10) >> 0xE; /* todo: index *= 4 */

    pbuf = buf;
    x = pbuf[index];
    y = pbuf[index + 1];

    if (0xFF == x) {
        Proc_Break(proc);
        return;
    }

    if (0x18 == x && 0x09 == y)
        SMS_UpdateFromGameData();

    TileMap_CopyRect(TILEMAP_LOCATED(gBmFrameTmap0, x, y), gBG0TilemapBuffer, 8, 9);
    BG_EnableSyncByMask(BG0_SYNC_BIT);
    
}

void ProcLightRuneAnim_End(struct ProcMapEffectAnimFx *proc)
{
    SetDefaultColorEffects();
    BG_Fill(gBG0TilemapBuffer, 0x0);
    BG_EnableSyncByMask(BG0_SYNC_BIT);
}

void StartLightRuneAnim(ProcPtr parent, int x, int y)
{
    Proc_StartBlocking(ProcScr_LightRuneAnim, parent);

    x = x * 0x10 - gGameState.camera.x - 0x18;
    y = y * 0x10 - gGameState.camera.y - 0x28;

    BG_SetPosition(0, -x, -y);
}

void ProcLightRuneAnim2_Init(struct ProcMapEffectAnimFx *proc)
{
    int i;

    CopyDataWithPossibleUncomp(Img_LightRune, BG_CHR_ADDR(BGCHR_LIGHTRUNE_IMG));
    ApplyPalette(Pal_LightRune, BGPAL_LIGHTRUNE_IMG);
    CopyDataWithPossibleUncomp(Tsa_LightRune, gBmFrameTmap0);

    for (i = 0; i < 0x360; i++)
        gBmFrameTmap0[i] += TILEREF(BGCHR_LIGHTRUNE_IMG, BGPAL_LIGHTRUNE_IMG);

    BG_Fill(gBG0TilemapBuffer, TILEREF(BGCHR_LIGHTRUNE_IMG, 0));
    BG_EnableSyncByMask(BG0_SYNC_BIT);
    PlaySoundEffect(0x2D8);

    SetSpecialColorEffectsParameters(0x1, 0x10, 0x10, 0x0);
    SetBlendTargetA(1, 0, 0, 0, 0);
    SetBlendTargetB(0, 1, 1, 1, 1);

    proc->counter = 0;
}

void ProcLightRuneAnim2_Loop(struct ProcMapEffectAnimFx *proc)
{
    u8 buf[0x34];
    u8 *pbuf;
    int index;
    int x, y;

    memcpy(buf, Vectors_LightRune2, 0x34);
    proc->counter++;

    index = (proc->counter / 3);
    index = (index << 0x10) >> 0xE; /* todo: index *= 4 */

    pbuf = buf;
    x = pbuf[index];
    y = pbuf[index + 1];

    if (0xFF == x) {
        Proc_Break(proc);
        return;
    }

    if (0x18 == x && 0x09 == y)
        SMS_UpdateFromGameData();

    TileMap_CopyRect(TILEMAP_LOCATED(gBmFrameTmap0, x, y), gBG0TilemapBuffer, 8, 9);
    BG_EnableSyncByMask(BG0_SYNC_BIT);
    
}

void ProcLightRuneAnim2_End(struct ProcMapEffectAnimFx *proc)
{
    SetDefaultColorEffects();
    BG_Fill(gBG0TilemapBuffer, 0x0);
    BG_EnableSyncByMask(BG0_SYNC_BIT);
}

void StartLightRuneAnim2(ProcPtr parent, int x, int y)
{
    Proc_StartBlocking(ProcScr_LightRuneAnim2, parent);

    x = x * 0x10 - gGameState.camera.x - 0x18;
    y = y * 0x10 - gGameState.camera.y - 0x28;

    BG_SetPosition(0, -x, -y);
}

void ProcLightRuneAnim3_Init(struct ProcMapEffectAnimFx *proc)
{
    int i;

    CopyDataWithPossibleUncomp(Img_LightRune, BG_CHR_ADDR(BGCHR_LIGHTRUNE_IMG));
    ApplyPalette(Pal_LightRune, BGPAL_LIGHTRUNE_IMG);
    CopyDataWithPossibleUncomp(Tsa_LightRune, gBmFrameTmap0);

    for (i = 0; i < 0x360; i++)
        gBmFrameTmap0[i] += TILEREF(BGCHR_LIGHTRUNE_IMG, BGPAL_LIGHTRUNE_IMG);

    BG_Fill(gBG0TilemapBuffer, TILEREF(BGCHR_LIGHTRUNE_IMG, 0));
    BG_EnableSyncByMask(BG0_SYNC_BIT);
    PlaySoundEffect(0x2D8);

    SetSpecialColorEffectsParameters(0x1, 0x10, 0x10, 0x0);
    SetBlendTargetA(1, 0, 0, 0, 0);
    SetBlendTargetB(0, 1, 1, 1, 1);

    proc->counter = 0;
}

void ProcLightRuneAnim3_Loop(struct ProcMapEffectAnimFx *proc)
{
    u8 buf[0x34];
    u8 *pbuf;
    int index;
    int x, y;

    memcpy(buf, Vectors_LightRune3, 0x34);
    proc->counter++;

    index = (proc->counter / 3);
    index = (index << 0x10) >> 0xE; /* todo: index *= 4 */

    pbuf = buf;
    x = pbuf[index];
    y = pbuf[index + 1];

    if (0xFF == x) {
        Proc_Break(proc);
        return;
    }

    if (0x18 == x && 0x09 == y)
        SMS_UpdateFromGameData();

    TileMap_CopyRect(TILEMAP_LOCATED(gBmFrameTmap0, x, y), gBG0TilemapBuffer, 8, 9);
    BG_EnableSyncByMask(BG0_SYNC_BIT);
    
}

void ProcLightRuneAnim3_End(struct ProcMapEffectAnimFx *proc)
{
    SetDefaultColorEffects();
    BG_Fill(gBG0TilemapBuffer, 0x0);
    BG_EnableSyncByMask(BG0_SYNC_BIT);
}

void StartLightRuneAnim3(ProcPtr parent, int x, int y)
{
    Proc_StartBlocking(ProcScr_LightRuneAnim3, parent);

    x = x * 0x10 - gGameState.camera.x - 0x18;
    y = y * 0x10 - gGameState.camera.y - 0x28;

    BG_SetPosition(0, -x, -y);
}
