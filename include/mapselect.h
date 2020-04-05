#ifndef GUARD_MAPSELECT_H
#define GUARD_MAPSELECT_H

struct SelectTarget
{
    /* 00 */ s8 x, y;
    /* 02 */ s8 uid;
    /* 03 */ u8 extra;

    /* 04 */ struct SelectTarget* next;
    /* 08 */ struct SelectTarget* prev;
};

struct SelectInfo
{
    /* 00 */ void(*onInit)(ProcPtr proc);
    /* 04 */ void(*onEnd)(ProcPtr proc);

    /* 08 */ void(*onUnk08)(ProcPtr proc, struct SelectTarget* target);

    /* 0C */ void(*onSwitchIn)(ProcPtr proc, struct SelectTarget* target);
    /* 10 */ void(*onSwitchOut)(ProcPtr proc, struct SelectTarget* target);

    /* 14 */ int(*onSelect)(ProcPtr proc, struct SelectTarget* target);
    /* 18 */ int(*onCancel)(ProcPtr proc, struct SelectTarget* target);
    /* 1C */ int(*onHelp)(ProcPtr proc, struct SelectTarget* target);
};

#endif // GUARD_MAPSELECT_H
