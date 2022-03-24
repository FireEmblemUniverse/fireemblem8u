#ifndef GUARD_EV_TRIGGERCHECK_H
#define GUARD_EV_TRIGGERCHECK_H

struct EventCheckBuffer {
    /* 00 */ struct EventCheckBuffer* eventDef;
    /* 04 */ u32 eventCode;
    /* 08 */ u32 eId;
    /* 0C */ u32 commandId;

    /* 10 */ u8 _pad10[0x18-0x10];

    /* 18 */ u8 xPos;
    /* 19 */ u8 yPos;
};

struct EventCheckEntry {
    /* 00 */ void(*eventCheck)(struct EventCheckBuffer buffer);
    /* 04 */ int size;
};

#endif // GUARD_EV_TRIGGERCHECK_H
