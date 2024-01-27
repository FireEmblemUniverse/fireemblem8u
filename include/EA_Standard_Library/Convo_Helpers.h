#pragma once

#define Text(msg) \
    TEXTSTART \
    TEXTSHOW(msg) \
    TEXTEND \
    REMA

#define Text_BG(bg, msg) \
    EvtSetSlot(EVT_SLOT_2, (bg)) \
    EvtSetSlot(EVT_SLOT_3, (msg)) \
    EvtCall(Event_TextWithBG)

#define SetBackground(bg) \
    SVAL(EVT_SLOT_2, bg) \
    CALL(EventScr_SetBackground)
