#pragma once

#define IfYesSelectedGoto(label) SVAL(EVT_SLOT_7, true) BEQ(label, EVT_SLOT_C, EVT_SLOT_7)
#define IfNoSelectedGoto(label) SVAL(EVT_SLOT_7, true) BNE(label, EVT_SLOT_C, EVT_SLOT_7)
