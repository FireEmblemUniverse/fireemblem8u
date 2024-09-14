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

struct ProcCmd CONST_DATA ProcScr_TacticianNameSelection[] = {
    PROC_YIELD,
    PROC_CALL(Tactician_InitScreen),
    PROC_CALL(FadeInBlackSpeed20),
    PROC_YIELD,
    PROC_CALL(Clear_0203DDDC),
PROC_LABEL(0),
    PROC_REPEAT(Tactician_Loop),
    PROC_GOTO(2),
PROC_LABEL(1),
    PROC_CALL(sub_8044FE4),
    PROC_REPEAT(sub_8044FFC),
    PROC_CALL(sub_804503C),
    PROC_REPEAT(sub_8045068),
    PROC_GOTO(0),
PROC_LABEL(3),
    PROC_CALL(NameSelect_DrawName),
    PROC_REPEAT(sub_8045108),
    PROC_GOTO(0),
PROC_LABEL(2),
    PROC_CALL(Set_0203DDDC),
    PROC_CALL(sub_8013F40),
    PROC_YIELD,
    PROC_CALL(sub_80451F0),
    PROC_END,
};

const struct TacticianTextConf gTacticianTextConf[] = {
    [0] = {
        .str = { "", "","","","","","","","","","","",},
        .x = 0x0,
        .y = 0x0,
        .adj_idx = { 0, 0, 0, 0 },
    },
    [1] = {
        .str = { " ", "",""," ","",""," ","",""," ","","",},
        .x = 0xCA,
        .y = 0x48,
        .kind = 1,
        .adj_idx = { 5, 2, 60, 6 },
        .action = 1
    },
    [2] = {
        .str = { " ", "",""," ","",""," ","",""," ","","",},
        .x = 0xCA,
        .y = 0x58,
        .kind = 1,
        .adj_idx = { 1, 3, 65, 11 },
        .action = 2
    },
    [3] = {
        .str = { " ", "",""," ","",""," ","",""," ","","",},
        .x = 0xCA,
        .y = 0x68,
        .kind = 1,
        .adj_idx = { 2, 4, 70, 16 },
        .action = 3
    },
    [4] = {
        .str = { " ", "",""," ","",""," ","",""," ","","",},
        .x = 0xCA,
        .y = 0x78,
        .kind = 1,
        .adj_idx = { 5, 5, 75, 21 },
        .action = 4
    },
    [5] = {
        .str = { " ", "",""," ","",""," ","",""," ","","",},
        .x = 0xCA,
        .y = 0x88,
        .kind = 1,
        .adj_idx = { 4, 4, 80, 26 },
        .action = 5
    },
    [6] = {
        .str = { "A", "","","A","","","A","","","A","","",},
        .x = 0x10,
        .y = 0x48,
        .adj_idx = { 26, 11, 4, 7 },
    },
    [7] = {
        .str = { "B", "","","B","","","B","","","B","","",},
        .x = 0x1A,
        .y = 0x48,
        .adj_idx = { 27, 12, 6, 8 },
    },
    [8] = {
        .str = { "C", "","","C","","","C","","","C","","",},
        .x = 0x24,
        .y = 0x48,
        .adj_idx = { 28, 13, 7, 9 },
    },
    [9] = {
        .str = { "D", "","","D","","","D","","","D","","",},
        .x = 0x2E,
        .y = 0x48,
        .adj_idx = { 29, 14, 8, 10 },
    },
    [10] = {
        .str = { "E", "","","E","","","E","","","E","","",},
        .x = 0x38,
        .y = 0x48,
        .adj_idx = { 30, 15, 9, 31 },
    },
    [11] = {
        .str = { "P", "","","P","","","P","","","P","","",},
        .x = 0x10,
        .y = 0x58,
        .adj_idx = { 6, 16, 4, 12 },
    },
    [12] = {
        .str = { "Q", "","","Q","","","Q","","","Q","","",},
        .x = 0x1A,
        .y = 0x58,
        .adj_idx = { 7, 17, 11, 13 },
    },
    [13] = {
        .str = { "R", "","","R","","","R","","","R","","",},
        .x = 0x24,
        .y = 0x58,
        .adj_idx = { 8, 18, 12, 14 },
    },
    [14] = {
        .str = { "S", "","","S","","","S","","","S","","",},
        .x = 0x2E,
        .y = 0x58,
        .adj_idx = { 9, 19, 13, 15 },
    },
    [15] = {
        .str = { "T", "","","T","","","T","","","T","","",},
        .x = 0x38,
        .y = 0x58,
        .adj_idx = { 10, 20, 14, 36 },
    },
    [16] = {
        .str = { "a", "","","a","","","a","","","a","","",},
        .x = 0x10,
        .y = 0x68,
        .adj_idx = { 11, 21, 4, 17 },
    },
    [17] = {
        .str = { "b", "","","b","","","b","","","b","","",},
        .x = 0x1A,
        .y = 0x68,
        .adj_idx = { 12, 22, 16, 18 },
    },
    [18] = {
        .str = { "c", "","","c","","","c","","","c","","",},
        .x = 0x24,
        .y = 0x68,
        .adj_idx = { 13, 23, 17, 19 },
    },
    [19] = {
        .str = { "d", "","","d","","","d","","","d","","",},
        .x = 0x2E,
        .y = 0x68,
        .adj_idx = { 14, 24, 18, 20 },
    },
    [20] = {
        .str = { "e", "","","e","","","e","","","e","","",},
        .x = 0x38,
        .y = 0x68,
        .adj_idx = { 15, 25, 19, 41 },
    },
    [21] = {
        .str = { "p", "","","p","","","p","","","p","","",},
        .x = 0x10,
        .y = 0x78,
        .adj_idx = { 16, 26, 4, 22 },
    },
    [22] = {
        .str = { "q", "","","q","","","q","","","q","","",},
        .x = 0x1A,
        .y = 0x78,
        .adj_idx = { 17, 27, 21, 23 },
    },
    [23] = {
        .str = { "r", "","","r","","","r","","","r","","",},
        .x = 0x24,
        .y = 0x78,
        .adj_idx = { 18, 28, 22, 24 },
    },
    [24] = {
        .str = { "s", "","","s","","","s","","","s","","",},
        .x = 0x2E,
        .y = 0x78,
        .adj_idx = { 19, 29, 23, 25 },
    },
    [25] = {
        .str = { "t", "","","t","","","t","","","t","","",},
        .x = 0x38,
        .y = 0x78,
        .adj_idx = { 20, 30, 24, 46 },
    },
    [26] = {
        .str = { "1", "","","1","","","1","","","1","","",},
        .x = 0x10,
        .y = 0x88,
        .adj_idx = { 21, 6, 5, 27 },
    },
    [27] = {
        .str = { "2", "","","2","","","2","","","2","","",},
        .x = 0x1A,
        .y = 0x88,
        .adj_idx = { 22, 7, 26, 28 },
    },
    [28] = {
        .str = { "3", "","","3","","","3","","","3","","",},
        .x = 0x24,
        .y = 0x88,
        .adj_idx = { 23, 8, 27, 29 },
    },
    [29] = {
        .str = { "4", "","","4","","","4","","","4","","",},
        .x = 0x2E,
        .y = 0x88,
        .adj_idx = { 24, 9, 28, 30 },
    },
    [30] = {
        .str = { "5", "","","5","","","5","","","5","","",},
        .x = 0x38,
        .y = 0x88,
        .adj_idx = { 25, 10, 29, 51 },
    },
    [31] = {
        .str = { "F", "","","F","","","F","","","F","","",},
        .x = 0x50,
        .y = 0x48,
        .adj_idx = { 51, 36, 10, 32 },
    },
    [32] = {
        .str = { "G", "","","G","","","G","","","G","","",},
        .x = 0x5A,
        .y = 0x48,
        .adj_idx = { 52, 37, 31, 33 },
    },
    [33] = {
        .str = { "H", "","","H","","","H","","","H","","",},
        .x = 0x64,
        .y = 0x48,
        .adj_idx = { 53, 38, 32, 34 },
    },
    [34] = {
        .str = { "I", "","","I","","","I","","","I","","",},
        .x = 0x6E,
        .y = 0x48,
        .adj_idx = { 54, 39, 33, 35 },
    },
    [35] = {
        .str = { "J", "","","J","","","J","","","J","","",},
        .x = 0x78,
        .y = 0x48,
        .adj_idx = { 55, 40, 34, 56 },
    },
    [36] = {
        .str = { "U", "","","U","","","U","","","U","","",},
        .x = 0x50,
        .y = 0x58,
        .adj_idx = { 31, 41, 15, 37 },
    },
    [37] = {
        .str = { "V", "","","V","","","V","","","V","","",},
        .x = 0x5A,
        .y = 0x58,
        .adj_idx = { 32, 42, 36, 38 },
    },
    [38] = {
        .str = { "W", "","","W","","","W","","","W","","",},
        .x = 0x64,
        .y = 0x58,
        .adj_idx = { 33, 43, 37, 39 },
    },
    [39] = {
        .str = { "X", "","","X","","","X","","","X","","",},
        .x = 0x6E,
        .y = 0x58,
        .adj_idx = { 34, 44, 38, 40 },
    },
    [40] = {
        .str = { "Y", "","","Y","","","Y","","","Y","","",},
        .x = 0x78,
        .y = 0x58,
        .adj_idx = { 35, 45, 39, 61 },
    },
    [41] = {
        .str = { "f", "","","f","","","f","","","f","","",},
        .x = 0x50,
        .y = 0x68,
        .adj_idx = { 36, 46, 20, 42 },
    },
    [42] = {
        .str = { "g", "","","g","","","g","","","g","","",},
        .x = 0x5A,
        .y = 0x68,
        .adj_idx = { 37, 47, 41, 43 },
    },
    [43] = {
        .str = { "h", "","","h","","","h","","","h","","",},
        .x = 0x64,
        .y = 0x68,
        .adj_idx = { 38, 48, 42, 44 },
    },
    [44] = {
        .str = { "i", "","","i","","","i","","","i","","",},
        .x = 0x6E,
        .y = 0x68,
        .adj_idx = { 39, 49, 43, 45 },
    },
    [45] = {
        .str = { "j", "","","j","","","j","","","j","","",},
        .x = 0x78,
        .y = 0x68,
        .adj_idx = { 40, 50, 44, 66 },
    },
    [46] = {
        .str = { "u", "","","u","","","u","","","u","","",},
        .x = 0x50,
        .y = 0x78,
        .adj_idx = { 41, 51, 25, 47 },
    },
    [47] = {
        .str = { "v", "","","v","","","v","","","v","","",},
        .x = 0x5A,
        .y = 0x78,
        .adj_idx = { 42, 52, 46, 48 },
    },
    [48] = {
        .str = { "w", "","","w","","","w","","","w","","",},
        .x = 0x64,
        .y = 0x78,
        .adj_idx = { 43, 53, 47, 49 },
    },
    [49] = {
        .str = { "x", "","","x","","","x","","","x","","",},
        .x = 0x6E,
        .y = 0x78,
        .adj_idx = { 44, 54, 48, 50 },
    },
    [50] = {
        .str = { "y", "","","y","","","y","","","y","","",},
        .x = 0x78,
        .y = 0x78,
        .adj_idx = { 45, 55, 49, 71 },
    },
    [51] = {
        .str = { "6", "","","6","","","6","","","6","","",},
        .x = 0x50,
        .y = 0x88,
        .adj_idx = { 46, 31, 30, 52 },
    },
    [52] = {
        .str = { "7", "","","7","","","7","","","7","","",},
        .x = 0x5A,
        .y = 0x88,
        .adj_idx = { 47, 32, 51, 53 },
    },
    [53] = {
        .str = { "8", "","","8","","","8","","","8","","",},
        .x = 0x64,
        .y = 0x88,
        .adj_idx = { 48, 33, 52, 54 },
    },
    [54] = {
        .str = { "9", "","","9","","","9","","","9","","",},
        .x = 0x6E,
        .y = 0x88,
        .adj_idx = { 49, 34, 53, 55 },
    },
    [55] = {
        .str = { "0", "","","0","","","0","","","0","","",},
        .x = 0x78,
        .y = 0x88,
        .adj_idx = { 50, 35, 54, 76 },
    },
    [56] = {
        .str = { "K", "","","K","","","K","","","K","","",},
        .x = 0x90,
        .y = 0x48,
        .adj_idx = { 76, 61, 35, 57 },
    },
    [57] = {
        .str = { "L", "","","L","","","L","","","L","","",},
        .x = 0x9A,
        .y = 0x48,
        .adj_idx = { 77, 62, 56, 58 },
    },
    [58] = {
        .str = { "M", "","","M","","","M","","","M","","",},
        .x = 0xA4,
        .y = 0x48,
        .adj_idx = { 78, 63, 57, 59 },
    },
    [59] = {
        .str = { "N", "","","N","","","N","","","N","","",},
        .x = 0xAE,
        .y = 0x48,
        .adj_idx = { 79, 64, 58, 60 },
    },
    [60] = {
        .str = { "O", "","","O","","","O","","","O","","",},
        .x = 0xB8,
        .y = 0x48,
        .adj_idx = { 80, 65, 59, 4 },
    },
    [61] = {
        .str = { "Z", "","","Z","","","Z","","","Z","","",},
        .x = 0x90,
        .y = 0x58,
        .adj_idx = { 56, 66, 40, 62 },
    },
    [62] = {
        .str = { "!", "","","!","","","!","","","!","","",},
        .x = 0x9A,
        .y = 0x58,
        .adj_idx = { 57, 67, 61, 63 },
    },
    [63] = {
        .str = { "?", "","","?","","","?","","","?","","",},
        .x = 0xA4,
        .y = 0x58,
        .adj_idx = { 58, 68, 62, 64 },
    },
    [64] = {
        .str = { ",", "","",",","","",",","","",",","","",},
        .x = 0xAE,
        .y = 0x58,
        .adj_idx = { 59, 69, 63, 65 },
    },
    [65] = {
        .str = { ".", "","",".","","",".","","",".","","",},
        .x = 0xB8,
        .y = 0x58,
        .adj_idx = { 60, 70, 64, 4 },
    },
    [66] = {
        .str = { "k", "","","k","","","k","","","k","","",},
        .x = 0x90,
        .y = 0x68,
        .adj_idx = { 61, 71, 45, 67 },
    },
    [67] = {
        .str = { "l", "","","l","","","l","","","l","","",},
        .x = 0x9A,
        .y = 0x68,
        .adj_idx = { 62, 72, 66, 68 },
    },
    [68] = {
        .str = { "m", "","","m","","","m","","","m","","",},
        .x = 0xA4,
        .y = 0x68,
        .adj_idx = { 63, 73, 67, 69 },
    },
    [69] = {
        .str = { "n", "","","n","","","n","","","n","","",},
        .x = 0xAE,
        .y = 0x68,
        .adj_idx = { 64, 74, 68, 70 },
    },
    [70] = {
        .str = { "o", "","","o","","","o","","","o","","",},
        .x = 0xB8,
        .y = 0x68,
        .adj_idx = { 65, 75, 69, 4 },
    },
    [71] = {
        .str = { "z", "","","z","","","z","","","z","","",},
        .x = 0x90,
        .y = 0x78,
        .adj_idx = { 66, 76, 50, 72 },
    },
    [72] = {
        .str = { ":", "","",":","","",":","","",":","","",},
        .x = 0x9A,
        .y = 0x78,
        .adj_idx = { 67, 77, 71, 73 },
    },
    [73] = {
        .str = { "/", "","","/","","","/","","","/","","",},
        .x = 0xA4,
        .y = 0x78,
        .adj_idx = { 68, 78, 72, 74 },
    },
    [74] = {
        .str = { "&", "","","&","","","&","","","&","","",},
        .x = 0xAE,
        .y = 0x78,
        .adj_idx = { 69, 79, 73, 75 },
    },
    [75] = {
        .str = { "-", "","","-","","","-","","","-","","",},
        .x = 0xB8,
        .y = 0x78,
        .adj_idx = { 70, 80, 74, 4 },
    },
    [76] = {
        .str = { " ", "",""," ","",""," ","",""," ","","",},
        .x = 0x90,
        .y = 0x88,
        .adj_idx = { 71, 56, 55, 77 },
    },
    [77] = {
        .str = { " ", "",""," ","",""," ","",""," ","","",},
        .x = 0x9A,
        .y = 0x88,
        .adj_idx = { 72, 57, 76, 78 },
    },
    [78] = {
        .str = { " ", "",""," ","",""," ","",""," ","","",},
        .x = 0xA4,
        .y = 0x88,
        .adj_idx = { 73, 58, 77, 79 },
    },
    [79] = {
        .str = { " ", "",""," ","",""," ","",""," ","","",},
        .x = 0xAE,
        .y = 0x88,
        .adj_idx = { 74, 59, 78, 80 },
    },
    [80] = {
        .str = { " ", "",""," ","",""," ","",""," ","","",},
        .x = 0xB8,
        .y = 0x88,
        .adj_idx = { 75, 60, 79, 5 },
    },
};

const s16 SioTacticianIndexMap[] = {
    0x06, 0x07, 0x08, 0x09, 0x0A,
    0x1F, 0x20, 0x21, 0x22, 0x23,
    0x38, 0x39, 0x3A, 0x3B, 0x3C,
    0x0B, 0x0C ,0x0D, 0x0E, 0x0F,
    0x24, 0x25, 0x26, 0x27, 0x28,
    0x3D, 0x3E, 0x3F, 0x40, 0x41,
    0x10, 0x11, 0x12, 0x13, 0x14,
    0x29, 0x2A, 0x2B, 0x2C, 0x2D,
    0x42, 0x43, 0x44, 0x45, 0x46,
    0x15, 0x16, 0x17, 0x18, 0x19,
    0x2E, 0x2F, 0x30, 0x31, 0x32,
    0x47, 0x48, 0x49, 0x4A, 0x4B,
    0x1A, 0x1B, 0x1C, 0x1D, 0x1E,
    0x33, 0x34, 0x35, 0x36, 0x37,
    0x4C, 0x4D, 0x4E, 0x4F, 0x50,
};

const int gLinkArenaStatusMsg[] = {
    0x76D, // Not Linked
    0x76E, // Connecting
    0x76F, // Link Error
    0x770, // Done
    0x770, // Done
};


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
            int idx = SioTacticianIndexMap[i * 15 + j];
            const struct TacticianTextConf * conf = gTacticianTextConf + idx;
            u8 * str = conf->str[proc->line_idx * 3];

            if (*str != '\0')
            {
                Text_SetCursor(Texts_0203DB14 + (i + proc->text_idx * 5), conf->x);
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
    proc->child1 = StartNameEntrySpriteDraw(proc, conf->x - 4, conf->y + 1);
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

void Tactician_MoveHand(struct ProcTactician * proc, int pos, const struct TacticianTextConf * conf)
{
    int str_idx;
    u16 adj_idx;
    const struct TacticianTextConf * adj_conf;

    adj_idx  = conf->adj_idx[pos];
    adj_conf = gTacticianTextConf + conf->adj_idx[pos];

    str_idx = proc->line_idx * 3;

    while (*adj_conf->str[str_idx] == '\0')
    {
        adj_idx  = adj_conf->adj_idx[pos];
        adj_conf = gTacticianTextConf + adj_conf->adj_idx[pos];
    }
    proc->conf_idx = adj_idx;
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
void Tactician_LoopCore(struct ProcTactician * proc, const struct TacticianTextConf * conf)
{
    char var;

    if ((gKeyStatusPtr->repeatedKeys & DPAD_UP) != 0)
    {
        Tactician_MoveHand(proc, 0, conf);
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_DOWN) != 0)
    {
        Tactician_MoveHand(proc, 1, conf);
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_LEFT) != 0)
    {
        Tactician_MoveHand(proc, 2, conf);
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_RIGHT) != 0)
    {
        Tactician_MoveHand(proc, 3, conf);
    }

    if ((gKeyStatusPtr->newKeys & A_BUTTON) != 0)
    {
        switch (conf->action) {
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
            Tactician_MoveHand(proc, 2, conf);
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
    proc->conf_idx_bak = proc->conf_idx;

    Tactician_LoopCore(proc, conf);
    if (proc->conf_idx_bak != proc->conf_idx)
    {
        SioPlaySoundEffect(3);
    }

    conf = GetTacticianTextConf(proc->conf_idx);
    SioStrCpy(proc->str, _cbuf);

    _cbuf[proc->max_len - 1] = 0;

    UpdateNameEntrySpriteDraw(proc->child1, conf->x - 4, conf->y + 1, StrLen(_cbuf) * 7, conf->kind, (proc->line_idx <= 1) ? proc->line_idx : 2);
}

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
