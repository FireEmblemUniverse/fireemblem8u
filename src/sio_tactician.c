#include "global.h"
#include "fontgrp.h"
#include "hardware.h"
#include "proc.h"
#include "sio.h"
#include "bmunit.h"
#include "sio_core.h"
#include "bmlib.h"
#include "bmsave.h"
#include "prepscreen.h"
#include "uiutils.h"
#include "constants/characters.h"

//! FE8U = 0x08044550
const struct TacticianTextConf * GetTacticianTextConf(s16 idx)
{
    return gTacticianTextConf + idx;
}

void sub_8044560(struct ProcTactician * proc, u8 * str_buf)
{
    int i;
    int j;
    int k;

    int idx = 0;

    for (; *str_buf != 0 ; str_buf += 2)
    {
        for (i = 0; i <= 0x50; i++)
        {
            const struct TacticianTextConf * conf = GetTacticianTextConf(i);

            for (j = 0; j < 3; j++)
            {
                for (k = 0; k < 3; k++)
                {
                    u16 * str = (u16 *)(conf->str + j * 3)[k];

                    if (*str == *(u16 *)str_buf)
                    {
                        proc->unk4C[idx] = ((j & 3) << 0xe) | (i & 0x3FFF);
                        proc->unk39 = k;

                        idx++;

                        goto _080445F8;
                    }
                }
            }
        }

    _080445F8:
        // need a semi-colon for modern compilers
        ; // exit loop
    }

    return;
}

void sub_8044614(struct ProcTactician * proc)
{
    int i, j;

    for (i = 0; i < 5; i++)
    {
        ClearText(Texts_0203DB14 + (i + proc->text_idx * 5));
        Text_SetColor(Texts_0203DB14 + (i + proc->text_idx * 5), TEXT_COLOR_SYSTEM_WHITE);

        for (j = 0; j < 0xF; j++)
        {
            int idx = gUnknown_080D9C9E[i * 15 + j];
            const struct TacticianTextConf * conf = gTacticianTextConf + idx;
            u8 * str = conf->str[proc->line_idx * 3];

            if (*str != '\0')
            {
                Text_SetCursor(Texts_0203DB14 + (i + proc->text_idx * 5), conf->xpos);
                Text_DrawString(
                    Texts_0203DB14 + (i + proc->text_idx * 5),
                    conf->str[proc->line_idx * 3]
                );
            }
        }

        PutText(
            Texts_0203DB14 + (i + proc->text_idx * 5),
            TILEMAP_LOCATED(gBG1TilemapBuffer, 0, i * 2 + 9)
        );
    }
}

void TacticianDrawCharacters(struct ProcTactician * proc)
{
    int x;
    struct Text * text;
    const char * str = proc->str;

    ClearText(&Text_0203DB14);

    if (*str != '\0')
    {
        text = &Text_0203DB14;
        x = 0;
    
        while (*str != '\0')
        {
            Text_SetCursor(text, x);
            str = Text_DrawCharacter(text, str);
            x = x + 7;
        }
    }
    PutText(&Text_0203DB14, TILEMAP_LOCATED(gBG0TilemapBuffer, 12, 5));
    BG_EnableSyncByMask(BG0_SYNC_BIT);
}

int StrLen(u8 * buf)
{
    int i = 0;
    while (*buf != '\0')
    {
        i++;
        buf++;
    }
    return i;
}

void Tactician_InitScreen(struct ProcTactician * proc)
{
    int i, char_cnt;
    char * str;
    u8 str_buf[0x10];
    const struct TacticianTextConf * conf;

    ClearSioBG();
    InitSioBG();
    StartMuralBackgroundExt(proc, 0, 0, 0, 0);
    Decompress(Img_TacticianSelObj, (void *)0x06014800);
    ApplyPalette(Pal_TacticianSelObj, 0x13);
    ApplyPalette(Pal_085ADE68, 0x14);
    CallARM_FillTileRect(TILEMAP_LOCATED(gBG2TilemapBuffer, 0, 8), Tsa_085AE190, 0x1000);
    SetTextFont(&Font_0203DB64);
    InitSystemTextFont();
    ResetTextFont();

    if (CheckInLinkArena())
    {
        proc->max_len = 7;
    }
    else
    {
        gLinkArenaSt.unk_00 = 0;;
        proc->max_len = 5;
    }

    for (i = 0; i < (proc->max_len * 2 + 1); i++)
        proc->str[i] = '\0';

    for (i = 0; i < proc->max_len; i++)
        proc->unk4C[i] = 0;

    if (CheckInLinkArena())
        proc->max_len = 9;

    proc->cur_len = 0;
    InitText(&Text_0203DB14, 8);
    proc->line_idx = 1;
    proc->conf_idx = 6;

    conf = GetTacticianTextConf(6);
    proc->child1 = StartNameEntrySpriteDraw(proc, conf->xpos - 4, conf->unk32 + 1);
    proc->unk39 = 0;

    for (i = 0; i < 10; i++)
        InitText(Texts_0203DB14 + i, 0x1A);

    InitText(&Texts_0203DAB0, 0xC);
    StartLinkArenaTitleBanner(proc->child1, 3, 0x500);
    sub_804C508();
    gUnk_Sio_0203DD24 = 0;
    proc->text_idx = 0;
    sub_8044614(proc);

    /* 80448DE */
    if (proc->unk32 != 0)
    {
        i = 0;
        str = GetTacticianName();
        while (*str != '\0')
        {
            proc->str[i] = *str;
            str_buf[i] = *str;

            str++;
            i++;

            char_cnt = proc->cur_len + 1;
            if (char_cnt < proc->unk33)
                proc->cur_len = char_cnt;
        }
        sub_8044560(proc, str_buf);
        TacticianDrawCharacters(proc);
        proc->child1->unk40 = proc->cur_len * 7;
    }
    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);
}

void SioUpdateTeam(char * str, int team)
{
    int i;
    struct Unit * buffer = GetUnit(FACTION_RED + 1);
    for (i = 0; i < 5; i++)
        ClearUnit(buffer + i);

    for (i = 0; i < 5; i++)
    {
        u8 pid = gSioPidPool.pids[i];
        if (pid != 0)
        {
            struct Unit * unit = GetUnitFromCharId(pid);
            if (!(unit->state & US_NOT_DEPLOYED))
            {
                SetUnitStatus(unit, UNIT_STATUS_NONE);
                unit->state = 0;
                MemCpy(unit, buffer + i, sizeof(struct Unit));
            }
        }
    }
    WriteMultiArenaSaveTeam(team, buffer, str);
}

void sub_80449E8(struct ProcTactician * proc, int idx, const struct TacticianTextConf * conf)
{
    int str_idx;
    u16 ret;
    const struct TacticianTextConf * conf2;

    ret = conf->unk36[idx];
    conf2 = gTacticianTextConf + conf->unk36[idx];

    str_idx = proc->line_idx * 3;

    while (*conf2->str[str_idx] == '\0')
    {
        ret = conf2->unk36[idx];
        conf2 = gTacticianTextConf + conf2->unk36[idx];
    }
    proc->conf_idx = ret;
}

void TacticianTryAppendChar(struct ProcTactician * proc, const struct TacticianTextConf * conf)
{
    int cur_len;

    if (proc->cur_len < proc->max_len)
    {
        SioPlaySoundEffect(2);
        SioStrCpy(conf->str[proc->line_idx * 3], &proc->str[proc->cur_len]);

        proc->unk4C[proc->cur_len] = (0x3FFF & proc->conf_idx) | ((3 & proc->line_idx) << 14);
        cur_len = proc->cur_len + 1;

        if (cur_len < proc->max_len)
            proc->cur_len = cur_len;
        else
            proc->conf_idx = 5;

        TacticianDrawCharacters(proc);
        proc->unk39 = 0;
    }
    else
    {
        SioPlaySoundEffect(0);
    }
}

void TacticianTryDeleteChar(struct ProcTactician * proc, const struct TacticianTextConf * conf)
{
    int cur_len;

    if (proc->cur_len != 0)
    {
        SioPlaySoundEffect(2);

        if (proc->unk4C[proc->cur_len] == 0)
            proc->cur_len--;

        *(proc->str + proc->cur_len) = 0;
        proc->unk4C[proc->cur_len] = 0;
        proc->unk39 = 0;

        TacticianDrawCharacters(proc);
    }
    else
    {
        SioPlaySoundEffect(0);
    }
}

void SaveTactician(struct ProcTactician * proc, const struct TacticianTextConf * conf)
{
    if (proc->str[0] != '\0')
    {
        SioPlaySoundEffect(2);

        if (CheckInLinkArena())
            SioUpdateTeam(proc->str, gLinkArenaSt.unk_03);
        else
            SetTacticianName(proc->str);

        Proc_Break(proc);
    }
    else
    {
        SioPlaySoundEffect(0);
    }
}

bool sub_8044B78(struct ProcTactician * proc, const struct TacticianTextConf * conf, u32 c, int d)
{
    if (proc->line_idx > 1 && d == 0)
    {
        SioPlaySoundEffect(2);
        TacticianTryAppendChar(proc, conf);
        return false;
    }

    if (proc->cur_len != 0)
    {
        const struct TacticianTextConf * conf2;
        int r8, line_idx;
        u16 conf_idx;

        if (0x3FFF & proc->unk4C[proc->cur_len / 2])
            r8 = 0;
        else
            r8 = 1;

        conf_idx = 0x3FFF & proc->unk4C[proc->cur_len / 2 - r8];
        conf2 = GetTacticianTextConf(conf_idx);
        line_idx = proc->unk4C[proc->cur_len / 2 - r8] >> 14;

        if (*conf2->str[line_idx * 3 + c] != '\0')
        {
            SioPlaySoundEffect(2);
            SioStrCpy(conf2->str[line_idx * 3 + c], &proc->str[proc->cur_len] - r8 * 2);
            TacticianDrawCharacters(proc);
            proc->unk39 = c;
            return true;
        }
        else if (d == 0)
            SioPlaySoundEffect(0);
    }
    else if (d == 0)
        SioPlaySoundEffect(0);

    return false;
}

//! FE8U = 0x08044C54
void sub_8044C54(struct ProcTactician * proc, const struct TacticianTextConf * conf)
{
    char var;

    if ((gKeyStatusPtr->repeatedKeys & DPAD_UP) != 0)
    {
        sub_80449E8(proc, 0, conf);
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_DOWN) != 0)
    {
        sub_80449E8(proc, 1, conf);
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_LEFT) != 0)
    {
        sub_80449E8(proc, 2, conf);
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_RIGHT) != 0)
    {
        sub_80449E8(proc, 3, conf);
    }

    if ((gKeyStatusPtr->newKeys & A_BUTTON) != 0)
    {
        switch (conf->unk3E)
        {
            case 0:
                TacticianTryAppendChar(proc, conf);
                break;

            case 4:
                TacticianTryDeleteChar(proc, conf);
                break;

            case 5:
                SaveTactician(proc, conf);
                break;

            case 6:
                sub_8044B78(proc, conf, 1, 0);

                break;

            case 7:
                sub_8044B78(proc, conf, 2, 0);

                break;

            case 1:
                if (proc->line_idx != 0)
                {
                    SioPlaySoundEffect(2);
                    proc->line_idx = 0;
                    proc->unk39 = 0;

                    Proc_Goto(proc, 1);
                    return;
                }

                SioPlaySoundEffect(0);
                break;

            case 2:
                if (proc->line_idx != 1)
                {
                    SioPlaySoundEffect(2);

                    proc->line_idx = 1;
                    proc->unk39 = 0;

                    Proc_Goto(proc, 1);
                    return;
                }

                SioPlaySoundEffect(0);
                break;

            case 3:
                if (proc->line_idx < 2 || proc->line_idx > 3)
                {
                    SioPlaySoundEffect(2);

                    proc->line_idx = 2;

                    if (proc->unk32 != 0)
                    {
                        proc->line_idx = 3;
                    }

                    proc->unk39 = 0;

                    Proc_Goto(proc, 1);
                    return;
                }

                SioPlaySoundEffect(0);

                break;
        }
    }

    if ((gKeyStatusPtr->newKeys & R_BUTTON) != 0)
    {
        var = proc->unk39;

        do
        {
            proc->unk39++;
            proc->unk39 = (proc->unk39 % 3);

            if (var == proc->unk39)
                break;

        } while (sub_8044B78(proc, conf, proc->unk39, 1) == 0);
    }

    if ((gKeyStatusPtr->newKeys & L_BUTTON) != 0)
    {
        TacticianTryDeleteChar(proc, conf);
    }

    if ((gKeyStatusPtr->newKeys & START_BUTTON) != 0)
    {
        SioPlaySoundEffect(3);
        proc->conf_idx = 5;
    }

    if ((gKeyStatusPtr->newKeys & SELECT_BUTTON) != 0)
    {
        SioPlaySoundEffect(2);

        proc->line_idx++;

        if ((proc->line_idx == 2) && (proc->unk32 != 0))
        {
            proc->line_idx++;
        }

        proc->line_idx %= 4;

        if (proc->line_idx == 3 && proc->unk32 == 0)
        {
            proc->line_idx = 0;
        }

        if (*conf->str[proc->line_idx * 3] == 0)
        {
            sub_80449E8(proc, 2, conf);
        }

        Proc_Goto(proc, 1);
        return;
    }

    if ((gKeyStatusPtr->newKeys & B_BUTTON) != 0)
    {
        if (proc->cur_len != 0)
        {
            TacticianTryDeleteChar(proc, conf);
            return;
        }

        if (CheckInLinkArena() != 0)
        {
            SioPlaySoundEffect(1);
            Proc_Goto(proc, 3);
        }
    }

    return;
}

//! FE8U = 0x08044ED8
void Tactician_Loop(struct ProcTactician * proc)
{
    char _cbuf[proc->max_len + 1];
    const struct TacticianTextConf * conf = GetTacticianTextConf(proc->conf_idx);
    proc->unk36 = proc->conf_idx;

    sub_8044C54(proc, conf);
    if (proc->unk36 != proc->conf_idx)
    {
        SioPlaySoundEffect(3);
    }

    conf = GetTacticianTextConf(proc->conf_idx);
    SioStrCpy(proc->str, _cbuf);

    _cbuf[proc->max_len - 1] = 0;

    UpdateNameEntrySpriteDraw(proc->child1, conf->xpos - 4, conf->unk32 + 1, StrLen(_cbuf) * 7, conf->unk34, (proc->line_idx <= 1) ? proc->line_idx : 2);
}

extern u8 gUnknown_03001810;

//! FE8U = 0x08044F84
void sub_8044F84(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount > DISPLAY_HEIGHT)
    {
        return;
    }

    if (vcount < 40)
    {
        REG_BLDCNT = 0x840;
        REG_BLDALPHA = 0xF08;
    }
    else
    {
        REG_BLDCNT = 0x442;
        REG_BLDALPHA = ((15 - gUnknown_03001810) << 8) + gUnknown_03001810;
    }

    return;
}

void sub_8044FE4(struct ProcTactician * proc)
{
    proc->unk3A = 0;
    SetPrimaryHBlankHandler(sub_8044F84);
    return;
}

//! FE8U = 0x08044FFC
void sub_8044FFC(struct ProcTactician * proc)
{
    gUnknown_03001810 = Interpolate(INTERPOLATE_LINEAR, 15, 0, proc->unk3A, 8);
    proc->unk3A++;

    if (proc->unk3A > 8)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0804503C
void sub_804503C(struct ProcTactician * proc)
{
    proc->text_idx++;
    proc->text_idx &= 1;

    sub_8044614(proc);
    BG_EnableSyncByMask(BG1_SYNC_BIT);

    proc->unk3A = 0;

    return;
}

//! FE8U = 0x08045068
void sub_8045068(struct ProcTactician * proc)
{
    gUnknown_03001810 = Interpolate(INTERPOLATE_LINEAR, 0, 15, proc->unk3A, 8);
    proc->unk3A++;

    if (proc->unk3A > 8)
    {
        SetPrimaryHBlankHandler(NULL);
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080450AC
void NameSelect_DrawName(struct ProcTactician * proc)
{
    proc->unk3B = 1;

    sub_804D80C();

    ClearText(&Texts_0203DAB0);

    Text_DrawString(&Texts_0203DAB0, GetStringFromIndex(0x141)); // TODO: msgid "Back"
    Text_SetCursor(&Texts_0203DAB0, 38);

    Text_DrawString(&Texts_0203DAB0, GetStringFromIndex(0x146)); // TODO: msgid "Entry"
    PutText(&Texts_0203DAB0, TILEMAP_LOCATED(gBG0TilemapBuffer, 11, 12));

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}

//! FE8U = 0x08045108
void sub_8045108(struct ProcTactician * proc)
{
    PutLinkArenaChoiceBannerSprite(0x40, 0x58);

    if (((gKeyStatusPtr->newKeys & DPAD_LEFT) != 0) && (proc->unk3B == 1))
    {
        proc->unk3B = 0;
        SioPlaySoundEffect(3);
    }

    if (((gKeyStatusPtr->newKeys & DPAD_RIGHT) != 0) && (proc->unk3B == 0))
    {
        proc->unk3B = 1;
        SioPlaySoundEffect(3);
    }

    DisplayUiHand(proc->unk3B * 40 + 80, 96);

    if ((gKeyStatusPtr->newKeys & B_BUTTON) != 0)
    {
        SioPlaySoundEffect(1);

        TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 11, 12), 12, 2, 0);
        BG_EnableSyncByMask(BG0_SYNC_BIT);

        Proc_Break(proc);

        return;
    }

    if ((gKeyStatusPtr->newKeys & A_BUTTON) != 0)
    {
        if (proc->unk3B == 0)
        {
            SioPlaySoundEffect(2);
            gUnk_Sio_0203DD24 = 1;
            Proc_Goto(proc, 2);
        }
        else
        {
            SioPlaySoundEffect(1);
        }

        TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 11, 12), 12, 2, 0);
        BG_EnableSyncByMask(BG0_SYNC_BIT);

        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080451F0
void sub_80451F0(void)
{
    EndMuralBackground();

    if (!CheckInLinkArena())
    {
        nullsub_13();
    }

    return;
}
