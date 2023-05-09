#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"

struct BanimUnkStructCommPriv {
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x32);

    /* 32 */ s16 unk32;

    /* 34 */ STRUCT_PAD(0x34, 0x3A);

    /* 3A */ s16 unk3A;

    /* 3C */ STRUCT_PAD(0x3C, 0x4C);

    /* 4C */ int unk4C;
};

/* Struct20200E0, Unknown_0201FADC, Unknown_030053A0, Unknown_030053E0 */
struct BanimUnkStructComm {
    /* 00 */ u16 unk00;
    /* 02 */ u16 unk02;
    /* 04 */ u16 unk04;
    /* 06 */ u16 unk06;
    /* 08 */ u16 unk08;
    /* 0A */ u16 unk0A;
    /* 0C */ u16 unk0C;
    /* 0E */ s16 unk0E;
    /* 10 */ u16 unk10;
    /* 14 */ void *proc14;
    /* 18 */ void *proc18;
    /* 1C */ void *unk1C;
    /* 20 */ void *unk20;
    /* 24 */ void *unk24;
};

void sub_805AE14(struct BanimUnkStructComm *buf)
{
    if (buf->unk0E == -1) {
        if (buf->proc14)
            Proc_End(buf->proc14);

        if (buf->proc18)
            Proc_End(buf->proc18);
    }
}

void sub_805AE40(void *_buf, s16 a, s16 b, s16 c, s16 d)
{
    struct BanimUnkStructComm *buf = _buf;
    struct BanimUnkStructCommPriv *priv;

    priv = buf->proc14;
    priv->unk32 = a;
    priv->unk3A = b;

    priv = buf->proc18;
    priv->unk32 = c;
    priv->unk3A = d;
}
