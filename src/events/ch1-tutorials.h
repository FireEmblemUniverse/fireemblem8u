#pragma once

#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "eventcall.h"
#include "EAstdlib.h"
#include "constants/characters.h"

CONST_DATA EventListScr EventScr_Ch1Tut_GuideWTA[] = {
    /**
     * The relationship between swords, lances,
     * and axes is called the weapon triangle...
     */
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, -1)
    TEXTSHOW(0x93D)
    TEXTEND
    REMA

    ENUT(0xBA) /* Guide:Weapon Triangle */
    ENDA
};

CONST_DATA EventListScr EventScr_Ch1Tut_EirikaVisitHouseInit[] = {
    MUSC(0x9)

    /**
     * Seth.
     * I need to know what's happening here.
     * I'm going to visit that home.
     */
    Text(0x92E)

    CURSOR_FLASHING(13, 6)
    STAL(60)
    CURE

    /**
     * It's time to visit a home. First,
     * place the cursor on Eirika
     * and press the A Button.
     */
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, -1)
    TEXTSHOW(0x93E)
    TEXTEND
    REMA

    CURSOR_FLASHING_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE

    EvtEnqueueConditionalTutCall(
        EventScr_Ch1Tut_EirikaVisitHouseIdle1,
        TUTORIAL_EVT_TYPE_ONSELECT)

    DISABLEOPTIONS(EVENT_MENUOVERRIDE_END)
    NoFade
    ENDA
};

CONST_DATA EventListScr EventScr_Ch1Tut_EirikaVisitHouseIdle1[] = {
    NoFade

    TutEventExecType0(
        CHARACTER_EIRIKA,
        13, 6,
        0x940,      /* Move Eirika to the house... */
        0x00080008,
        0x93F,      /* The cursor is now on Eirika... */
        0x00080008,
        EventScr_Ch1Tut_EirikaVisitHouseIdle2,
        EventScr_Ch1Tut_EirikaVisitHouseIdle1
    )
    ENDA
};

CONST_DATA EventListScr EventScr_Ch1Tut_EirikaVisitHouseIdle2[] = {
    NoFade
    IGNORE_KEYS(0)

    TutEventExecType1(
        13, 6,
        0,
        0,
        EventScr_Ch1Tut_EirikaVisitHouseEnd,
        EventScr_Ch1Tut_EirikaVisitHouseIdle2
    )
    DISABLEOPTIONS(~EVENT_MENUOVERRIDE_VISIT)
    IGNORE_KEYS(R_BUTTON | START_BUTTON | B_BUTTON)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch1Tut_EirikaVisitHouseEnd[] = {
    NoFade
    IGNORE_KEYS(0)

    /**
     * You can get battle hints and other useful information by
     * talking to people in homes. This can be very beneficial,
     * so be sure to visit houses when you have the chance.
     * Now select Visit and press the A Button.
     */
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, _EvtParams2(0x48, 0x38))
    TEXTSHOW(0x941)
    TEXTEND
    REMA

    ENUT(0xCF) /* Guide:Houses */
    IGNORE_KEYS(R_BUTTON | START_BUTTON | B_BUTTON)

    EvtEnqueueConditionalTutCall(
        EventScr_Ch1Tut_GuideTerrainHeal,
        TUTORIAL_EVT_TYPE_POSTACTION)

    ENDA
};

CONST_DATA EventListScr EventScr_Ch1Tut_GuideTerrainHeal[] = {
    IGNORE_KEYS(0)

    CURSOR_FLASHING(7, 7)
    CURSOR_FLASHING(7, 2)
    CURSOR_FLASHING(2, 2)
    STAL(60)
    CURE

    /**
     * Units on gates, forts, and other special areas recover Hit Points (HP) at the
     * beginning of your turn. Currently, the enemy commander, Breguet,
     * is standing on a gate. Even if he takes
     * damage, he'll soon recover some of the HP he lost.
     */
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, -1)
    TEXTSHOW(0x942)
    TEXTEND
    REMA

    ENUT(0xCE) /* Guide:Fortresses & Castle Gates */
    DISABLEOPTIONS(EVENT_MENUOVERRIDE_TRADE)
    NoFade
    ENDA
};

CONST_DATA EventListScr EventScr_Ch1Tut_OnBeginning[] = {
    FlashCursor(CHARACTER_SETH, 60)

    /**
     * Starting with this chapter, you will control not only Eirika, but also Seth,
     * general of the Knights of Renais. You select and move him in the same way
     * you do Eirika: by placing the cursor on him and pressing the A Button.
     * When all of your units have finished moving, your enemy's turn will begin
     * automatically. If Eirika, the leader of your group, falls
     * in battle, the game is over. You can choose to continue playing if any
     * of your allies fall, but defeated allies will never fight at your side again.
     * Try to move forward with the fewest number of casualties possible.
     */
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, -1)
    TEXTSHOW(0x943)
    TEXTEND
    REMA

    ENUT(0xB6) /* Guide:Game Over */
    ENUT(0xD7) /* Guide:Retreating from the Front Lines */

    /**
     * Lady Eirika, what are your orders?
     */
    Text(0x92F)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch1Tut_GuideMsg944[] = {
    /**
     * Allied units have joined the battle.
     * All allied blue units can be moved
     * in the same manner as Eirika.
     */
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, -1)
    TEXTSHOW(0x944)
    TEXTEND
    REMA

    ENUT(0xD6) /* Guide:Acquiring Items */
    ENDA
};

CONST_DATA EventListScr EventScr_Ch1Tut_GilliamBattle[] = {
    SVAL(EVT_SLOT_1, 19)
    SET_HP(CHARACTER_GILLIAM)

    STAL(60)
    MOVE(0, CHARACTER_GILLIAM, 8, 2)
    ENUN

    StartBattle
    NormalDamage(0, 0)
    MissedAttack(1, 0)
    NormalDamage(1, 2)
    EndAttack
    SVAL(EVT_SLOT_B, _EvtParams2(8, 3))
    FIGHT(CHARACTER_GILLIAM, -1, 0, 0)

    SVAL(EVT_SLOT_2, EventScr_Ch1Tut_GuideMsg944)
    CALL(EventScr_CallOnTutorialMode)

    MOVE(0, CHARACTER_FRANZ, 8, 1)
    ENUN
    FlashCursor(CHARACTER_FRANZ, 60)

    /**
     * Sir Gilliam! Are you all right?
     * It's just a scratch.
     * Wait! I...I have a vulnerary with me.
     * Let me give it to you.
     */
    MUSI
    Text(0x933)
    MUNO

    /**
     * It's time to trade items. First,
     * place the cursor on Gilliam and
     * press the A Button.
     */
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, -1)
    TEXTSHOW(0x946)
    TEXTEND
    REMA

    CURSOR_FLASHING_CHAR(CHARACTER_GILLIAM)
    STAL(60)
    CURE

    EvtEnqueueConditionalTutCall(
        EventScr_Ch1Tut_TradeSelectGalliamIdle1,
        TUTORIAL_EVT_TYPE_ONSELECT)

    DISABLEOPTIONS(EVENT_MENUOVERRIDE_END)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch1Tut_TradeSelectGalliamIdle1[] = {
    NoFade

    TutEventExecType0(
        CHARACTER_GILLIAM,
        8, 2,
        0x947,      /* It's time to trade items... */
        _EvtParams2(0x28, 0x40),
        0x946,      /* The cursor is on Gilliam... */
        _EvtParams2(0x28, 0x40),
        EventScr_Ch1Tut_TradeSelectGalliamIdle2,
        EventScr_Ch1Tut_TradeSelectGalliamIdle1
    )
    IGNORE_KEYS(L_BUTTON | R_BUTTON | DPAD_ANY | START_BUTTON | SELECT_BUTTON | B_BUTTON)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch1Tut_TradeSelectGalliamIdle2[] = {
    NoFade
    IGNORE_KEYS(0)

    TutEventExecType1(
        8, 2,
        0,
        0,
        EventScr_Ch1Tut_TradeSelectGalliamEnd,
        EventScr_Ch1Tut_TradeSelectGalliamIdle2
    )
    DISABLEOPTIONS(~EVENT_MENUOVERRIDE_TRADE)
    IGNORE_KEYS(R_BUTTON | START_BUTTON | B_BUTTON)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch1Tut_TradeSelectGalliamEnd[] = {
    NoFade
    IGNORE_KEYS(0)

    /**
     * Now select Trade.
     */
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, _EvtParams2(72, 56))
    TEXTSHOW(0x948)
    TEXTEND
    REMA

    IGNORE_KEYS(R_BUTTON | START_BUTTON | B_BUTTON)
    ENUT(0x87) /* Tutorial: Item Trade */

    /*
     * Well...
     * I have to admit with no idea how trade tutorial CTRL works...
     * Maybe the msg-0x948 can directly exec msg949 and then msg94A automatically?
     */

    EvtEnqueueConditionalTutCall(
        EventScr_Ch1Tut_AfterTrade,
        TUTORIAL_EVT_TYPE_AFTERMOVE)

    ENDA
};

CONST_DATA EventListScr EventScr_Ch1Tut_AfterTrade[] = {
    NoFade

    /**
     * You can use the vulnerary you received right away.
     * Select the vulnerary from your items and use it.
     */
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, _EvtParams2(72, 56))
    TEXTSHOW(0x94D)
    TEXTEND
    REMA

    ENUT(0xC7) /* 辞典:使用方法 */
    ENUT(0xC8) /* 辞典:物品交换 */

    EvtEnqueueConditionalTutCall(
        EventScr_Ch1Tut_PostTradeAndItemUseAction,
        TUTORIAL_EVT_TYPE_POSTACTION)

    ENDA
};

CONST_DATA EventListScr EventScr_Ch1Tut_PostTradeAndItemUseAction[] = {
    FlashCursor(CHARACTER_FRANZ, 60)
    Text(0x932) /* Thanks, lad.Please.. */
    DISABLEOPTIONS(0)
    CALL(EventScr_Ch1Tut_MsgOnGuideOption)
    NoFade
    ENDA
};

CONST_DATA EventListScr EventScr_Ch1Tut_GuideMsgSeize[] = {
    /**
     * You defeated Breguet, commander of Grado's forces in Mulan.
     * All that remains is to seize the castle gate.
     * Only your commander can perform this task.
     * The commander of this group is Eirika.
     * Move her to the castle gate, seize it, and clear this map.
     */
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, -1)
    TEXTSHOW(0x945)
    TEXTEND
    REMA

    ENUT(0xDD) /* 辞典:占领 */

    CURSOR_FLASHING(2, 2)
    STAL(60)
    CURE

    ENDA
};

CONST_DATA EventListScr EventScr_Ch1Tut_ChooseSethTurn1[] = {
    /**
     * Place the cursor on Seth and press the A Button.
     */
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, -1)
    TEXTSHOW(0x94E)
    TEXTEND
    REMA

    CURSOR_FLASHING_CHAR(CHARACTER_SETH)
    STAL(60)
    CURE

    StartBattle
    NormalDamage(0, 0)
    NormalDamage(1, 0)
    CriticalHit(0, 0)
    EndAttack
    FIGHT_SCRIPT

    EvtEnqueueConditionalTutCall(
        EventScr_Ch1Tut_SethMoveToEnemy,
        TUTORIAL_EVT_TYPE_ONSELECT)

    DISABLEOPTIONS(EVENT_MENUOVERRIDE_END | EVENT_MENUOVERRIDE_OPTIONS)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch1Tut_SethMoveToEnemy[] = {
    NoFade

    TutEventExecType0(
        CHARACTER_SETH,
        9, 6,
        0x950,      /* Seth must move near his foe... */
        _EvtParams2(8, 8),
        0x94F,      /* The cursor is now on Seth... */
        _EvtParams2(8, 8),
        EventScr_Ch1Tut_BeforeSethMoveToEnemy,
        EventScr_Ch1Tut_SethMoveToEnemy
    )
    ENDA
};

CONST_DATA EventListScr EventScr_Ch1Tut_BeforeSethMoveToEnemy[] = {
    NoFade
    IGNORE_KEYS(0)

    TutEventExecType1(
        9, 6,
        0x950,
        _EvtParams2(8, 8),
        EventScr_Ch1Tut_AfterSethMoveToEnemy,
        EventScr_Ch1Tut_BeforeSethMoveToEnemy
    )
    DISABLEOPTIONS(~EVENT_MENUOVERRIDE_ATTACK)
    IGNORE_KEYS(R_BUTTON | START_BUTTON | B_BUTTON)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch1Tut_AfterSethMoveToEnemy[] = {
    NoFade
    IGNORE_KEYS(0)

    /**
     * The enemy has an axe, so it's best to counter with a sword.
     * Choose Attack and press the A Button.
     */
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, _EvtParams2(72, 56))
    TEXTSHOW(0x952)
    TEXTEND
    REMA

    IGNORE_KEYS(R_BUTTON | START_BUTTON | B_BUTTON)
    DISABLEWEAPONS(EVENT_MENUOVERRIDE_WEAPON2)

    EvtEnqueueConditionalTutCall(
        EventScr_Ch1Tut_GuideOnBKSEL,
        TUTORIAL_EVT_TYPE_FORECAST)

    ENDA
};

CONST_DATA EventListScr EventScr_Ch1Tut_GuideOnBKSEL[] = {
    NoFade
    IGNORE_KEYS(R_BUTTON)

    /**
     * This is the combat information window.
     * At the top of the window, next to Seth's name, is a
     * weapon and an arrow pointing up. This is because
     * Seth has a sword, while the soldier has an axe.
     * The weapon triangle states that swords are strong
     * against axes. Seth is at an advantage.
     */
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, _EvtParams2(84, 16))
    TEXTSHOW(0x951)
    TEXTEND
    REMA

    IGNORE_KEYS(R_BUTTON | START_BUTTON | B_BUTTON)

    EvtEnqueueConditionalTutCall(
        EventScr_Ch1Tut_AfterSethBattleEirikaVisit,
        TUTORIAL_EVT_TYPE_POSTACTION)

    NoFade
    ENDA
};

CONST_DATA EventListScr EventScr_Ch1Tut_AfterSethBattleEirikaVisit[] = {
    NoFade
    IGNORE_KEYS(0)
    EvtEnqueueCallDirectly(EventScr_Ch1Tut_EirikaVisitHouseInit)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch1Tut_MsgOnGuideOption[] = {
    /**
     * Move the cursor to an unoccupied space on the map, and press the 
     * A Button to open the map menu. The third item from the top is Guide.
     * Try selecting it.
     * The guide contains lots of useful game-play information.
     * If you run into something that seems unclear, review the guide
     * for a quick reference.
     */
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, -1)
    TEXTSHOW(0x953)
    TEXTEND
    REMA

    ENDA
};
