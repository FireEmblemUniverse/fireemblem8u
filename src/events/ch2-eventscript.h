#pragma once

#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "eventcall.h"
#include "EAstdlib.h"
#include "playerphase.h"
#include "constants/characters.h"

CONST_DATA EventListScr EventScr_Ch2_BeginingScene[] = {
    MUSC(0x24)

    SVAL(EVT_SLOT_2, 0x18)
    CALL(EventScr_SetBackground)

    TEXTSHOW(0x954)
    TEXTEND
    REMA

    FADI(16)
    CLEAN
    FADU(16)

    LOAD1(0x1, UnitDef_088B440C)
    ENUN

    MUSCMID(0x7fff)
    LOAD1(0x1, UnitDef_088B4344)
    ENUN
    LOAD1(0x1, UnitDef_088B44AC)
    ENUN
    STAL2(60)

    MUSC(0x1a)
    CUMO_CHAR(CHARACTER_BONE)
    STAL(60)
    CURE

    Text(0x955)

    MOVE(0x18, CHARACTER_BAZBA, 14, 9)
    ENUN
    DISA(CHARACTER_BAZBA)

    CUMO_AT(12, 3)
    STAL(60)
    CURE

    MUSC(0x25)
    Text_BG(0x2, 0x956)

    CUMO_CHAR(CHARACTER_BONE)
    STAL(60)
    CURE

    TEXTSTART
    TEXTSHOW(0x957)
    TEXTEND
    REMA

    MOVE(0x18, CHARACTER_BONE, 9, 14)
    ENUN
    SVAL(EVT_SLOT_B, 0x5000c)
    MOVE(0x0, CHAR_EVT_POSITION_AT_SLOTB, 12, 3)
    ENUN
    SOUN(0xab)
    SVAL(EVT_SLOT_B, 0x2000c)
    TILECHANGE(0xffff)
    SOUN(0x5c)
    NOTIFY(0x12, 0x0)
    LOAD1(0x1, UnitDef_088B4434)
    ENUN
    SVAL(EVT_SLOT_1, 0x5)
    SET_HP(CHARACTER_ROSS)
    CUMO_CHAR(CHARACTER_ROSS)
    STAL(60)
    CURE

    Text_BG(0x1D, 0x958)

    SVAL(EVT_SLOT_2, EventScr_089F0790)
    CALL(EventScr_CallOnTutorialMode)

    LOAD1(0x0, UnitDef_Event_Ch2Ally)
    ENUN
    CUMO_CHAR(CHARACTER_VANESSA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0x959)
    TEXTEND
    REMA
    MOVE(0x18, CHARACTER_VANESSA, 2, 3)
    ENUN
    CUMO_CHAR(CHARACTER_VANESSA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0x95a)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, EventScr_089F07B0)
    CALL(EventScr_CallOnTutorialMode)
    CUMO_CHAR(CHARACTER_MOULDER)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0x95b)
    TEXTEND
    REMA
    MOVE(0x18, CHARACTER_VANESSA, 6, 3)
    ENUN
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch2_Turn1Player[] = {
    SVAL(EVT_SLOT_2, EventScr_089F07D0)
    CALL(EventScr_CallOnTutorialMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch2_Turn2Player[] = {
    SVAL(EVT_SLOT_2, EventScr_089F0C98)
    CALL(EventScr_CallOnTutorialMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch2_EndingScene[] = {
    MUSC(0x31)
    CHECK_ALIVE(CHARACTER_GARCIA)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_ROSS)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, 0x1d)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0x962)
    TEXTEND
    REMA
    FADI(16)
    SVAL(EVT_SLOT_2, 0xa)
    CALL(EventScr_LoadUniqueAlly)
    SVAL(EVT_SLOT_2, 0x7)
    CALL(EventScr_LoadUniqueAlly)
LABEL(0x0)
    SVAL(EVT_SLOT_2, 0x4)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0x963)
    TEXTEND
    FADI(4)
    MUSCSLOW(0x7fff)
    REMA
    REMOVEPORTRAITS
    BACG(0x20)
    FADU(2)
    TEXTSHOW(0x964)
    TEXTEND
    FAWI(2)
    REMA
    BACG(0x16)
    FAWU(2)
    MUSC(0x52)
    BROWNBOXTEXT(0x211, 8, 8)
    TEXTSHOW(0x965)
    TEXTEND
    FAWI(2)
    EvtBgmFadeIn(0x7fff, 8) // ENOSUPP in EAstdlib
    REMA
    BACG(0x20)
    FAWU(2)
    EvtBgmFadeIn(0x4a, 8) // ENOSUPP in EAstdlib
    TEXTSHOW(0x966)
    TEXTEND
    REMA
    FADI(16)
    ENUT(208)
    ENUT(232)
    ENUT(188)
    ENUT(184)
    ENUT(197)
    ENUT(184)
    ENUT(192)
    ENUT(196)
    ENUT(202)
    ENUT(222)
    ENUT(218)
    ENUT(203)
    MNCH(0x3)
    SVAL(EVT_SLOT_2, 0x7)
    CALL(EventScr_9EE5BC)
    SVAL(EVT_SLOT_2, 0xa)
    CALL(EventScr_9EE5BC)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch2_Talk_EirikaRoss[] = {
    MUSS(0x30)
    STAL(33)
    IGNORE_KEYS(0x0)
    TEXTSTART
    TEXTSHOW(0x967)
    TEXTEND
    REMA
    MURE(0x2)
    CUSA(CHARACTER_ROSS)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch2_Talk_RossGarcia[] = {
    MUSS(0x30)
    STAL(33)
    TEXTSTART
    TEXTSHOW(0x968)
    TEXTEND
    REMA
    MURE(0x2)
    CUSA(CHARACTER_GARCIA)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch2_Village1[] = {
    IGNORE_KEYS(0x0)
    CHECK_ACTIVE
    SVAL(EVT_SLOT_1, 0x1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_1)
    MUSI

    Text_BG(0x2, 0x969)

    MUNO
    GOTO(0x1)
LABEL(0x0)
    MUSI
    SVAL(EVT_SLOT_2, 0x2)
    SVAL(EVT_SLOT_3, 0x96a)
    CALL(Event_TextWithBG)
    MUNO
LABEL(0x1)
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x76)
    GIVEITEMTO(CHAR_EVT_ACTIVE_UNIT)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch2_Village2[] = {
    MUSI
    SVAL(EVT_SLOT_2, 0x2)
    SVAL(EVT_SLOT_3, 0x96b)
    CALL(Event_TextWithBG)
    MUNO
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x6d)
    GIVEITEMTO(CHAR_EVT_ACTIVE_UNIT)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch2_Village3[] = {
    MUSI
    SVAL(EVT_SLOT_2, 0x2)
    SVAL(EVT_SLOT_3, 0x96c)
    CALL(Event_TextWithBG)
    MUNO
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x6e)
    GIVEITEMTO(CHAR_EVT_ACTIVE_UNIT)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch2_Turn3Player[] = {
    SVAL(EVT_SLOT_2, UnitDef_088B4470)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, EventScr_089F1154)
    CALL(EventScr_CallOnTutorialMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F0770[] = {
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0x96d)
    TEXTEND
    REMA
    ENUT(208)
    ENDA
};

CONST_DATA EventListScr EventScr_089F0790[] = {
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0x96e)
    TEXTEND
    REMA
    ENUT(232)
    ENDA
};

CONST_DATA EventListScr EventScr_089F07B0[] = {
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0x96f)
    TEXTEND
    REMA
    ENUT(188)
    ENDA
};

CONST_DATA EventListScr EventScr_089F07D0[] = {
    MUSC(0x25)
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0x970)
    TEXTEND
    REMA
    CURSOR_FLASHING_CHAR(CHARACTER_VANESSA)
    STAL(60)
    CURE
    EvtEnqueueConditionalTutCall(EventScr_Ch2Tutorial1, TUTORIAL_EVT_TYPE_ONSELECT) // ENOSUPP in EAstdlib
    DISABLEOPTIONS(0x4000)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch2Tutorial1[] = {
    EVBIT_T(7)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x6)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x50009)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x971)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x580020)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x974)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x580020)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ch2Tutorial2)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ch2Tutorial1)
    SENQUEUE1
    CALL(EventScr_Tutorial_Exec0)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch2Tutorial2[] = {
    EVBIT_T(7)
    IGNORE_KEYS(0x0)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x50009)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ch2Tutorial3)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ch2Tutorial2)
    SENQUEUE1
    CALL(EventScr_Tutorial_Exec1)
    DISABLEOPTIONS(0xfff7)
    IGNORE_KEYS(0x10a)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch2Tutorial3[] = {
    EVBIT_T(7)
    IGNORE_KEYS(0x0)
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0x380048)
    TEXTSHOW(0x972)
    TEXTEND
    REMA
    IGNORE_KEYS(0x10a)
    EvtEnqueueConditionalTutCall(EventScr_Ch2Tutorial4, TUTORIAL_EVT_TYPE_ONSELECT) // ENOSUPP in EAstdlib
    ENDA
};

CONST_DATA EventListScr EventScr_Ch2Tutorial4[] = {
    EVBIT_T(7)
    IGNORE_KEYS(0x0)
    MUSI
    TEXTSTART
    TEXTSHOW(0x95d)
    TEXTEND
    REMA
    MUNO
    DISABLEOPTIONS(0x0)
    SHOW_ATTACK_RANGE(CHARACTER_VANESSA)
    CURSOR_FLASHING(8, 4)
    STAL(60)
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0x580010)
    TEXTSHOW(0x973)
    TEXTEND
    REMA
    CURE
    IGNORE_KEYS(0x10a)
    EvtEnqueueConditionalTutCall(EventScr_Ch2Tutorial5, TUTORIAL_EVT_TYPE_DESTSELECTED) // ENOSUPP in EAstdlib
    ENDA
};

CONST_DATA EventListScr EventScr_Ch2Tutorial5[] = {
    EVBIT_T(7)
    IGNORE_KEYS(0x0)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x40008)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ch2Tutorial6)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ch2Tutorial5)
    SENQUEUE1
    CALL(EventScr_Tutorial_Exec1)
    IGNORE_KEYS(0x10a)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch2Tutorial6[] = {
    EvtEnqueueConditionalTutCall(EventScr_Ch2Tutorial7, TUTORIAL_EVT_TYPE_POSTACTION) // ENOSUPP in EAstdlib
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch2Tutorial7[] = {
    IGNORE_KEYS(0x0)
    EvtEnqueueCallDirectly(EventScr_089F09F0) // ENOSUPP in EAstdlib
    ENUT(184)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F09F0[] = {
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0x97b)
    TEXTEND
    REMA
    CURSOR_FLASHING_CHAR(CHARACTER_MOULDER)
    STAL(60)
    CURE
    EvtEnqueueConditionalTutCall(EventScr_Ch2Tutorial8, TUTORIAL_EVT_TYPE_ONSELECT) // ENOSUPP in EAstdlib
    DISABLEOPTIONS(0x4000)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch2Tutorial8[] = {
    EVBIT_T(7)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x30007)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x97c)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x580020)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x97b)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x580020)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ch2Tutorial9)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ch2Tutorial8)
    SENQUEUE1
    CALL(EventScr_Tutorial_Exec0)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch2Tutorial9[] = {
    EVBIT_T(7)
    IGNORE_KEYS(0x0)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x30007)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ch2Tutorial10)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ch2Tutorial9)
    SENQUEUE1
    CALL(EventScr_Tutorial_Exec1)
    DISABLEOPTIONS(0xfffb)
    IGNORE_KEYS(0x10a)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch2Tutorial10[] = {
    EvtEnqueueConditionalTutCall(EventScr_Ch2Tutorial22, TUTORIAL_EVT_TYPE_POSTACTION) // ENOSUPP in EAstdlib
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch2Tutorial22[] = {
    IGNORE_KEYS(0x0)
    CUMO_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0x95c)
    TEXTEND
    REMA
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0x980)
    TEXTEND
    REMA
    CURSOR_FLASHING_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    EvtEnqueueConditionalTutCall(EventScr_Ch2Tutorial23, TUTORIAL_EVT_TYPE_ONSELECT) // ENOSUPP in EAstdlib
    DISABLEOPTIONS(0x4000)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch2Tutorial23[] = {
    EVBIT_T(7)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x1)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x20004)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x982)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x580020)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x981)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x580020)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ch2Tutorial24)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ch2Tutorial23)
    SENQUEUE1
    CALL(EventScr_Tutorial_Exec0)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch2Tutorial24[] = {
    EVBIT_T(7)
    IGNORE_KEYS(0x0)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x20004)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ch2Tutorial25)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ch2Tutorial24)
    SENQUEUE1
    CALL(EventScr_Tutorial_Exec1)
    DISABLEOPTIONS(0xffdf)
    IGNORE_KEYS(0x10a)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch2Tutorial25[] = {
    EVBIT_T(7)
    IGNORE_KEYS(0x0)
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0x380010)
    TEXTSHOW(0x983)
    TEXTEND
    REMA
    IGNORE_KEYS(0x10a)
    EvtEnqueueConditionalTutCall(EventScr_Ch2Tutorial26, TUTORIAL_EVT_TYPE_POSTACTION) // ENOSUPP in EAstdlib
    ENDA
};

CONST_DATA EventListScr EventScr_Ch2Tutorial26[] = {
    IGNORE_KEYS(0x0)
    SVAL(EVT_SLOT_2, EventScr_089F0770)
    CALL(EventScr_CallOnTutorialMode)
    DISABLEOPTIONS(0x0)
    EvtEnqueueCallDirectly(EventScr_089F11B8) // ENOSUPP in EAstdlib
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F0C98[] = {
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0x975)
    TEXTEND
    REMA
    CURSOR_FLASHING_CHAR(CHARACTER_VANESSA)
    STAL(60)
    CURE
    EvtEnqueueConditionalTutCall(EventScr_Ch2Tutorial11, TUTORIAL_EVT_TYPE_ONSELECT) // ENOSUPP in EAstdlib
    DISABLEOPTIONS(0x4000)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch2Tutorial11[] = {
    EVBIT_T(7)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x6)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x40008)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x976)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x580020)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x974)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x580020)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ch2Tutorial12)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ch2Tutorial11)
    SENQUEUE1
    CALL(EventScr_Tutorial_Exec0)
    IGNORE_KEYS(0x3fe)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch2Tutorial12[] = {
    EVBIT_T(7)
    IGNORE_KEYS(0x0)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x40008)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ch2Tutorial13)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ch2Tutorial12)
    SENQUEUE1
    CALL(EventScr_Tutorial_Exec1)
    DISABLEOPTIONS(0xffef)
    IGNORE_KEYS(0x10a)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch2Tutorial13[] = {
    EVBIT_T(7)
    EvtEnqueueConditionalTutCall(EventScr_Ch2Tutorial14, TUTORIAL_EVT_TYPE_ONSELECT) // ENOSUPP in EAstdlib
    ENDA
};

CONST_DATA EventListScr EventScr_Ch2Tutorial14[] = {
    EVBIT_T(7)
    IGNORE_KEYS(0x0)
    MUSC(0x9)
    TEXTSTART
    TEXTSHOW(0x95e)
    TEXTEND
    REMA
    ENUT(197)
    DISABLEOPTIONS(0x0)
    SHOW_ATTACK_RANGE(CHARACTER_VANESSA)
    CURSOR_FLASHING(9, 4)
    STAL(60)
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0x580010)
    TEXTSHOW(0x977)
    TEXTEND
    REMA
    CURE
    IGNORE_KEYS(0x10a)
    EvtEnqueueConditionalTutCall(EventScr_Ch2Tutorial15, TUTORIAL_EVT_TYPE_DESTSELECTED) // ENOSUPP in EAstdlib
    ENDA
};

CONST_DATA EventListScr EventScr_Ch2Tutorial15[] = {
    EVBIT_T(7)
    IGNORE_KEYS(0x0)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x40009)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ch2Tutorial16)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ch2Tutorial15)
    SENQUEUE1
    CALL(EventScr_Tutorial_Exec1)
    IGNORE_KEYS(0x10a)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch2Tutorial16[] = {
    EvtEnqueueConditionalTutCall(EventScr_Ch2Tutorial17, TUTORIAL_EVT_TYPE_POSTACTION) // ENOSUPP in EAstdlib
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch2Tutorial17[] = {
    IGNORE_KEYS(0x0)
    EvtEnqueueCallDirectly(EventScr_089F0E98) // ENOSUPP in EAstdlib
    ENUT(184)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F0E98[] = {
    CAMERA_CAHR(CHARACTER_MOULDER)
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0x978)
    TEXTEND
    REMA
    CURSOR_FLASHING_CHAR(CHARACTER_MOULDER)
    STAL(60)
    CURE
    EvtEnqueueConditionalTutCall(EventScr_Ch2Tutorial18, TUTORIAL_EVT_TYPE_ONSELECT) // ENOSUPP in EAstdlib
    DISABLEOPTIONS(0x4000)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch2Tutorial18[] = {
    EVBIT_T(7)
    CAMERA_CAHR(CHARACTER_MOULDER)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x30007)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x979)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x580020)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x978)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x580020)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ch2Tutorial19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ch2Tutorial18)
    SENQUEUE1
    CALL(EventScr_Tutorial_Exec0)
    IGNORE_KEYS(0x3fe)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch2Tutorial19[] = {
    EVBIT_T(7)
    ASMC(PlayPhaseForcePressAButtonInRangeDisp)
    DISABLEOPTIONS(0xfffd)
    IGNORE_KEYS(0x0)
    EvtEnqueueConditionalTutCall(EventScr_Ch2Tutorial20, TUTORIAL_EVT_TYPE_AFTERMOVE) // ENOSUPP in EAstdlib
    ENDA
};

CONST_DATA EventListScr EventScr_Ch2Tutorial20[] = {
    EVBIT_T(7)
    IGNORE_KEYS(0x0)
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0x380010)
    TEXTSHOW(0x97a)
    TEXTEND
    REMA
    IGNORE_KEYS(0x10a)
    EvtEnqueueConditionalTutCall(EventScr_Ch2Tutorial21, TUTORIAL_EVT_TYPE_POSTACTION) // ENOSUPP in EAstdlib
    ENDA
};

CONST_DATA EventListScr EventScr_Ch2Tutorial21[] = {
    IGNORE_KEYS(0x0)
    TEXTSTART
    TEXTSHOW(0x95f)
    TEXTEND
    REMA
    ENUT(192)
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0x97d)
    TEXTEND
    REMA
    ENUT(196)
    DISABLEOPTIONS(0x0)
    EvtEnqueueCallDirectly(EventScr_089F0FEC) // ENOSUPP in EAstdlib
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F0FEC[] = {
    CAMERA_CAHR(CHARACTER_EIRIKA)
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0x984)
    TEXTEND
    REMA
    CURSOR_FLASHING_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    EvtEnqueueConditionalTutCall(EventScr_Ch2Tutorial27, TUTORIAL_EVT_TYPE_ONSELECT) // ENOSUPP in EAstdlib
    DISABLEOPTIONS(0x4000)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch2Tutorial27[] = {
    EVBIT_T(7)
    CAMERA_CAHR(CHARACTER_EIRIKA)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x1)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x40006)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x986)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x580020)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x985)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x580020)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ch2Tutorial28)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ch2Tutorial27)
    SENQUEUE1
    CALL(EventScr_Tutorial_Exec0)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch2Tutorial28[] = {
    EVBIT_T(7)
    IGNORE_KEYS(0x0)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x40006)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ch2Tutorial29)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ch2Tutorial28)
    SENQUEUE1
    CALL(EventScr_Tutorial_Exec1)
    DISABLEOPTIONS(0xffbf)
    IGNORE_KEYS(0x10a)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch2Tutorial29[] = {
    EVBIT_T(7)
    IGNORE_KEYS(0x0)
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0x380010)
    TEXTSHOW(0x987)
    TEXTEND
    REMA
    IGNORE_KEYS(0x10a)
    EvtEnqueueConditionalTutCall(EventScr_Ch2Tutorial30, TUTORIAL_EVT_TYPE_POSTACTION) // ENOSUPP in EAstdlib
    ENDA
};

CONST_DATA EventListScr EventScr_Ch2Tutorial30[] = {
    IGNORE_KEYS(0x0)
    SVAL(EVT_SLOT_2, EventScr_089F1194)
    CALL(EventScr_CallOnTutorialMode)
    DISABLEOPTIONS(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F1154[] = {
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0x97e)
    TEXTEND
    REMA
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0x98a)
    TEXTEND
    REMA
    ENUT(202)
    ENUT(222)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F1194[] = {
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0x97f)
    TEXTEND
    REMA
    ENUT(218)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F11B8[] = {
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0x988)
    TEXTEND
    REMA
    CUMO_AT(5, 7)
    STAL(60)
    CURE
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0x989)
    TEXTEND
    REMA
    ENUT(203)
    EVBIT_T(7)
    ENDA
};
