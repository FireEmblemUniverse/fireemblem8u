#include "global.h"

#include "proc.h"
#include "bmio.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmlib.h"
#include "bmmind.h"
#include "scene.h"

EWRAM_DATA struct MsgBuffer sMsgString = {0};
EWRAM_DATA int sActiveMsg = 0;

const char *gStrPrefix[][2] =
{
    {"a ", "A "},
    {"an ", "An "},
};

const char * GetStrPrefix(s8 * str, bool capital)
{
    switch (str[0])
    {
    case 'A':
    case 'E':
    case 'I':
    case 'O':
    case 'U':
    case 'a':
    case 'e':
    case 'i':
    case 'o':
    case 'u':
        return gStrPrefix[1][capital];
    default:
        return gStrPrefix[0][capital];
    }
}

void InsertPrefix(char * str, const char * prefix, bool capital)
{
    const char * _prefix;
    u8 len_prefix;
    s16 i;

    if (prefix == NULL)
        _prefix = GetStrPrefix(str, capital);
    else
        _prefix = prefix;

    len_prefix = strlen(_prefix);
    for (i = strlen(str); i >= 0; i--)
        str[i + len_prefix] = str[i];

    for (i = 0; i < len_prefix; i++)
        str[i] = _prefix[i];
}

void SetMsgTerminator(signed char * str)
{
    short off = 0;
    u8 ch;

    while (str[off] != 0)
    {
        ch = str[off];
        if (ch == CHFE_L_LoadFace)   /* [LoadFace] */
            off += 2;

        if (ch == '\x80')   /* [HalfCloseEyes] */
            off += 1;
        off++;
    }

    off--;
    while (off >= 0)
    {
        ch = str[off];
        if (ch != '\x1F')   /* [.] */
            return;

        /* <!> [.] --> \x0 */
        ch = str[off - 1];
        if (ch != '\x80')   /* [HalfCloseEyes] */
            str[off] = '\0';

        off--;
    }
}

char * GetStringFromIndex(int index)
{
    if (index == sActiveMsg)
        return sMsgString.buffer1;
    CallARM_DecompText(gMsgStringTable[index], sMsgString.buffer1);
    SetMsgTerminator(sMsgString.buffer1);
    sActiveMsg = index;
    return sMsgString.buffer1;
}

char * GetStringFromIndexInBuffer(int index, char *buffer)
{
    CallARM_DecompText(gMsgStringTable[index], buffer);
    SetMsgTerminator(buffer);
    return buffer;
}

char * StringInsertSpecialPrefixByCtrl(void)
{
    u8 * r5 = sMsgString.buffer2;
    u8 * dst = sMsgString.buffer3;

    CopyString(r5, sMsgString.buffer1);
    while (*r5 != 0)
    {
        if (*r5 < '\x20')
            *dst++ = *r5++;
        else if (*r5 != '\x80') /* Normal string */
            *dst++ = *r5++;
        else
        {
            int r1;

            r5++;
            switch (*r5)
            {
            case '\x12':    /* wh:1280 */
                r1 = 0;
                break;
            case '\x13':    /* wh:1380 */
                r1 = 1;
                break;
            case '\x14':    /* wh:1480 */
                r1 = 2;
                break;
            case '\x15':    /* wh:1580 */
                r1 = 3;
                break;
            case '\x20':    /* [Tact]: "\x20\x80" */
                CopyString(dst, GetTacticianName());
                goto label;
            case '\x22':    /* [Item]: "\x22\x80" */
                CopyString(dst, GetItemName(gActionData.item));
                goto label;
            default:
                *dst++ = 0x80;
                *dst++ = *r5++;
                continue;
            }
            CopyString(dst, GetStringFromIndex(GetCharacterData(gPlaySt.unk1C[r1])->nameTextId));
        label:
            while (*dst != 0)
                dst++;
            r5++;
        }
    }
    *dst = 0;
    return sMsgString.buffer3;
}

char * StrInsertTact(void)
{
    u8 * r5 = sMsgString.buffer4;
    u8 * r4 = sMsgString.buffer5;
    u8 r1;
    u32 r0;

    CopyString(r5, sMsgString.buffer1);

    while ((r0 = *r5))
    {
        r1 = r0;
        while (0) ;
        if (r1 < 0x20)
        {
            *r4 = r0;
            ++r5;
            ++r4;
        }
        else if (r1 != 0x80)
        {
            *r4 = r0;
            ++r5;
            ++r4;
        }
        else
        {
            /* "\xxx\x80" */
            r5++;
            if (*r5 != 0x20)
            {
                *r4++ = r1;
                *r4++ = *r5++;
            }
            else
            {
                /* [Tact]: "\x20\x80" */
                CopyString(r4, GetTacticianName());
                while (*r4 != 0)
                    r4++;
                r5++;
            }
        }
    }
    *r4 = 0;
    return sMsgString.buffer5;
}
