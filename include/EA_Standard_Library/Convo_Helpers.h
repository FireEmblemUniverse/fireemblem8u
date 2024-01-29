#pragma once

#define Text(msg) \
    TEXTSTART \
    TEXTSHOW(msg) \
    TEXTEND \
    REMA

#define Text_BG(bg, msg) \
    SVAL(EVT_SLOT_2, (bg)) \
    SVAL(EVT_SLOT_3, (msg)) \
    CALL(Event_TextWithBG)

#define SetBackground(bg) \
    SVAL(EVT_SLOT_2, bg) \
    CALL(EventScr_SetBackground)
