#include "gbafe.h"

CONST_DATA EventListScr EventScr_Ch21xa_BeginningScene[] = {
    CALL(EventScr_089F94AC)
    ENDA
};

CONST_DATA EventListScr EventScr_089F94AC[] = {
    STARTFADE
    EvtColorFadeSetup(0x6, 0xa, 0, 0, 0, 0) // ENOSUPP in EAstdlib
    FADU(128)
    SOLOTEXTBOXSTART
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_1)
    SVAL(EVT_SLOT_B, 0x68ffff)
    TEXTSHOW(0xbc9)
    TEXTEND
    GOTO(0x1)
LABEL(0x0)
    SVAL(EVT_SLOT_B, 0x68ffff)
    TEXTSHOW(0xbca)
    TEXTEND
LABEL(0x1)
    REMA
    CHECK_EVBIT(2)
    BNE(0x2, EVT_SLOT_C, EVT_SLOT_0)
    EVBIT_MODIFY(0x1)
    ASMC(sub_807F878)
    LOAD1(0x1, UnitDef_088C2098)
    ENUN
    EvtColorFadeSetup(0x6, 0xa, 8, 256, 256, 256) // ENOSUPP in EAstdlib
    MUSC(SONG_LIGHTS_IN_THE_DARK)
    ASMC(sub_807FCC0)
    EVBIT_MODIFY(0x0)
    GOTO(0x3)
LABEL(0x2)
    MUSC(SONG_LIGHTS_IN_THE_DARK)
    LOAD1(0x1, UnitDef_088C2098)
    ENUN
LABEL(0x3)
    CAMERA2(11, 10)
    LOAD1(0x0, UnitDef_088C1F44)
    ENUN
    CUMO_CHAR(CHAR_EVT_PLAYER_LEADER)
    STAL(60)
    CURE
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0xa, EVT_SLOT_C, EVT_SLOT_1)
    TEXTSTART
    TEXTSHOW(0xbcb)
    TEXTEND
    REMA
    GOTO(0xb)
LABEL(0xa)
    TEXTSTART
    TEXTSHOW(0xbcc)
    TEXTEND
    REMA
LABEL(0xb)
    CAMERA2(11, 15)
    LOAD2(0x1, UnitDef_088C1F80)
    SVAL(EVT_SLOT_1, 0x0)
    SET_STATE(CHARACTER_EIRIKA)
    SVAL(EVT_SLOT_1, 0x0)
    SET_STATE(CHARACTER_EPHRAIM)
    SVAL(EVT_SLOT_1, 0x0)
    SET_STATE(CHARACTER_LARACHEL)
    SVAL(EVT_SLOT_1, 0x0)
    SET_STATE(CHARACTER_SETH)
    LOAD3(0x0, UnitDef_088C1FBC)
    ENUN
    SVAL(EVT_SLOT_1, 0xffffffff)
    SET_STATE(CHARACTER_EIRIKA)
    SVAL(EVT_SLOT_1, 0xffffffff)
    SET_STATE(CHARACTER_EPHRAIM)
    SVAL(EVT_SLOT_1, 0xffffffff)
    SET_STATE(CHARACTER_LARACHEL)
    SVAL(EVT_SLOT_1, 0xffffffff)
    SET_STATE(CHARACTER_SETH)
    CUMO_CHAR(CHAR_EVT_PLAYER_LEADER)
    STAL(60)
    CURE
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0xc, EVT_SLOT_C, EVT_SLOT_1)
    TEXTSTART
    TEXTSHOW(0xbcd)
    TEXTEND
    REMA
    GOTO(0xd)
LABEL(0xc)
    TEXTSTART
    TEXTSHOW(0xbce)
    TEXTEND
    REMA
LABEL(0xd)
    MUSC(SONG_THE_FINAL_BATTLE)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0xe, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_ALIVE(CHARACTER_EPHRAIM)
    BEQ(0x809d, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_EPHRAIM)
    BEQ(0x809d, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbd0)
    TEXTEND
    REMA
LABEL(0x809d)
    GOTO(0xf)
LABEL(0xe)
    CHECK_ALIVE(CHARACTER_EIRIKA)
    BEQ(0x80a1, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_EIRIKA)
    BEQ(0x80a1, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbcf)
    TEXTEND
    REMA
LABEL(0x80a1)
LABEL(0xf)
    CHECK_ALIVE(CHARACTER_SETH)
    BEQ(0x80a4, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_SETH)
    BEQ(0x80a4, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_SETH)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbd1)
    TEXTEND
    REMA
LABEL(0x80a4)
    CHECK_ALIVE(CHARACTER_KYLE)
    BEQ(0x80a5, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_KYLE)
    BEQ(0x80a5, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_KYLE)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbde)
    TEXTEND
    REMA
LABEL(0x80a5)
    CHECK_ALIVE(CHARACTER_FORDE)
    BEQ(0x80a6, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_FORDE)
    BEQ(0x80a6, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_FORDE)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbdf)
    TEXTEND
    REMA
LABEL(0x80a6)
    CHECK_ALIVE(CHARACTER_FRANZ)
    BEQ(0x80a7, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_FRANZ)
    BEQ(0x80a7, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_FRANZ)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbd2)
    TEXTEND
    REMA
LABEL(0x80a7)
    CHECK_ALIVE(CHARACTER_INNES)
    BEQ(0x80a9, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_INNES)
    BEQ(0x80a9, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_INNES)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbe1)
    TEXTEND
    REMA
LABEL(0x80a9)
    CHECK_ALIVE(CHARACTER_TANA)
    BEQ(0x80aa, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_TANA)
    BEQ(0x80aa, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_TANA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbe0)
    TEXTEND
    REMA
LABEL(0x80aa)
    CHECK_ALIVE(CHARACTER_VANESSA)
    BEQ(0x80ab, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_VANESSA)
    BEQ(0x80ab, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_VANESSA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbd5)
    TEXTEND
    REMA
LABEL(0x80ab)
    CHECK_ALIVE(CHARACTER_SYRENE)
    BEQ(0x80ac, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_SYRENE)
    BEQ(0x80ac, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_SYRENE)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbef)
    TEXTEND
    REMA
LABEL(0x80ac)
    CHECK_ALIVE(CHARACTER_GILLIAM)
    BEQ(0x80ad, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_GILLIAM)
    BEQ(0x80ad, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_GILLIAM)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbd3)
    TEXTEND
    REMA
LABEL(0x80ad)
    CHECK_ALIVE(CHARACTER_MOULDER)
    BEQ(0x80ae, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_MOULDER)
    BEQ(0x80ae, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_MOULDER)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbd4)
    TEXTEND
    REMA
LABEL(0x80ae)
    CHECK_ALIVE(CHARACTER_DUESSEL)
    BEQ(0x80b0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_DUESSEL)
    BEQ(0x80b0, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_DUESSEL)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbec)
    TEXTEND
    REMA
LABEL(0x80b0)
    CHECK_ALIVE(CHARACTER_KNOLL)
    BEQ(0x80b1, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_KNOLL)
    BEQ(0x80b1, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_KNOLL)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbee)
    TEXTEND
    REMA
LABEL(0x80b1)
    CHECK_ALIVE(CHARACTER_NATASHA)
    BEQ(0x80b2, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_NATASHA)
    BEQ(0x80b2, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_NATASHA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbdc)
    TEXTEND
    REMA
LABEL(0x80b2)
    CHECK_ALIVE(CHARACTER_CORMAG)
    BEQ(0x80b3, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_CORMAG)
    BEQ(0x80b3, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_CORMAG)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbe9)
    TEXTEND
    REMA
LABEL(0x80b3)
    CHECK_ALIVE(CHARACTER_AMELIA)
    BEQ(0x80b4, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_AMELIA)
    BEQ(0x80b4, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_AMELIA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbea)
    TEXTEND
    REMA
LABEL(0x80b4)
    CHECK_ALIVE(CHARACTER_GERIK)
    BEQ(0x80b6, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_GERIK)
    BEQ(0x80b6, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_GERIK)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbe2)
    TEXTEND
    REMA
LABEL(0x80b6)
    CHECK_ALIVE(CHARACTER_TETHYS)
    BEQ(0x80b7, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_TETHYS)
    BEQ(0x80b7, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_TETHYS)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbe3)
    TEXTEND
    REMA
LABEL(0x80b7)
    CHECK_ALIVE(CHARACTER_MARISA)
    BEQ(0x80b8, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_MARISA)
    BEQ(0x80b8, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_MARISA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbe4)
    TEXTEND
    REMA
LABEL(0x80b8)
    CHECK_ALIVE(CHARACTER_JOSHUA)
    BEQ(0x80b9, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_JOSHUA)
    BEQ(0x80b9, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_JOSHUA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbdd)
    TEXTEND
    REMA
LABEL(0x80b9)
    CHECK_ALIVE(CHARACTER_SALEH)
    BEQ(0x80bb, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_SALEH)
    BEQ(0x80bb, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_SALEH)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbe5)
    TEXTEND
    REMA
LABEL(0x80bb)
    CHECK_ALIVE(CHARACTER_EWAN)
    BEQ(0x80bc, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_EWAN)
    BEQ(0x80bc, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_EWAN)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbe6)
    TEXTEND
    REMA
LABEL(0x80bc)
    CHECK_ALIVE(CHARACTER_MYRRH)
    BEQ(0x80bd, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_MYRRH)
    BEQ(0x80bd, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_MYRRH)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbed)
    TEXTEND
    REMA
LABEL(0x80bd)
    CHECK_ALIVE(CHARACTER_GARCIA)
    BEQ(0x80bf, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_GARCIA)
    BEQ(0x80bf, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_GARCIA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbd6)
    TEXTEND
    REMA
LABEL(0x80bf)
    CHECK_ALIVE(CHARACTER_ROSS)
    BEQ(0x80c0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_ROSS)
    BEQ(0x80c0, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_ROSS)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbd7)
    TEXTEND
    REMA
LABEL(0x80c0)
    CHECK_ALIVE(CHARACTER_COLM)
    BEQ(0x80c1, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_COLM)
    BEQ(0x80c1, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_COLM)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbd8)
    TEXTEND
    REMA
LABEL(0x80c1)
    CHECK_ALIVE(CHARACTER_NEIMI)
    BEQ(0x80c2, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_NEIMI)
    BEQ(0x80c2, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_NEIMI)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbd9)
    TEXTEND
    REMA
LABEL(0x80c2)
    CHECK_ALIVE(CHARACTER_ARTUR)
    BEQ(0x80c3, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_ARTUR)
    BEQ(0x80c3, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_ARTUR)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbda)
    TEXTEND
    REMA
LABEL(0x80c3)
    CHECK_ALIVE(CHARACTER_LUTE)
    BEQ(0x80c4, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_LUTE)
    BEQ(0x80c4, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_LUTE)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbdb)
    TEXTEND
    REMA
LABEL(0x80c4)
    CHECK_ALIVE(CHARACTER_LARACHEL)
    BEQ(0x80c6, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_LARACHEL)
    BEQ(0x80c6, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_LARACHEL)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbe7)
    TEXTEND
    REMA
LABEL(0x80c6)
    CHECK_ALIVE(CHARACTER_DOZLA)
    BEQ(0x80c7, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_DOZLA)
    BEQ(0x80c7, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_DOZLA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbe8)
    TEXTEND
    REMA
LABEL(0x80c7)
    CHECK_ALIVE(CHARACTER_RENNAC)
    BEQ(0x80c8, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_RENNAC)
    BEQ(0x80c8, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_RENNAC)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbeb)
    TEXTEND
    REMA
LABEL(0x80c8)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x10, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_ALIVE(CHARACTER_EIRIKA)
    BEQ(0x80cc, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_EIRIKA)
    BEQ(0x80cc, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbcf)
    TEXTEND
    REMA
LABEL(0x80cc)
    GOTO(0x11)
LABEL(0x10)
    CHECK_ALIVE(CHARACTER_EPHRAIM)
    BEQ(0x80d0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_EPHRAIM)
    BEQ(0x80d0, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbd0)
    TEXTEND
    REMA
LABEL(0x80d0)
LABEL(0x11)
    CAMERA2(11, 6)
    SOLOTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0x68001c)
    TEXTSHOW(0xbf0)
    TEXTEND
    CAMERA2(11, 10)
    ASMC2(sub_8080474)
    CUMO_CHAR(CHAR_EVT_PLAYER_LEADER)
    STAL(60)
    CURE
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x12, EVT_SLOT_C, EVT_SLOT_1)
    TEXTSTART
    TEXTSHOW(0xbf1)
    TEXTEND
    REMA
    GOTO(0x13)
LABEL(0x12)
    TEXTSTART
    TEXTSHOW(0xbf2)
    TEXTEND
    REMA
LABEL(0x13)
    SVAL(EVT_SLOT_2, 0x19)
    CALL(EventScr_MoveUnitS2ToLeader)
    SVAL(EVT_SLOT_2, 0x2)
    CALL(EventScr_MoveUnitS2ToLeader)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch21xa_EndingScene[] = {
    CALL(EventScr_Ch21xa_EndingSceneExt)

    /**
     * MoveToGameEnding
     *      --> GC proc label: LGAMECTRL_EXEC_ENDING_SCENE
     *          --> CallGameEndingEvent
     *              --> EventScr_EirikaModeGameEnd
     *              --> EventScr_EphraimModeGameEnd
     */
    MNC4
    ENDA
};

CONST_DATA EventListScr EventScr_Ch21xa_EndingSceneExt[] = {
    MUSC(SONG_VICTORY_AND_THE_FUTURE)
    SetBackground(BG_BLACK_TEMPLE_INSIDE)
    TEXTSHOW(0xbf5)
    TEXTEND
    REMA
    CHECK_ALIVE(CHARACTER_TANA)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_SYRENE)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_VANESSA)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_MOULDER)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_GILLIAM)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    TEXTSHOW(0xbf6)
    TEXTEND
    REMA
LABEL(0x0)
    CHECK_ALIVE(CHARACTER_JOSHUA)
    BEQ(0x1, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_GERIK)
    BEQ(0x1, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_MARISA)
    BEQ(0x1, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_TETHYS)
    BEQ(0x1, EVT_SLOT_C, EVT_SLOT_0)
    TEXTSHOW(0xbf7)
    TEXTEND
    REMA
LABEL(0x1)
    CHECK_ALIVE(CHARACTER_NATASHA)
    BEQ(0x2, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_AMELIA)
    BEQ(0x2, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_DUESSEL)
    BEQ(0x2, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_CORMAG)
    BEQ(0x2, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_KNOLL)
    BEQ(0x2, EVT_SLOT_C, EVT_SLOT_0)
    TEXTSHOW(0xbf8)
    TEXTEND
    REMA
LABEL(0x2)
    CHECK_ALIVE(CHARACTER_DOZLA)
    BEQ(0x3, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_RENNAC)
    BEQ(0x3, EVT_SLOT_C, EVT_SLOT_0)
    TEXTSHOW(0xbf9)
    TEXTEND
    REMA
LABEL(0x3)
    CHECK_ALIVE(CHARACTER_SALEH)
    BEQ(0x4, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_EWAN)
    BEQ(0x4, EVT_SLOT_C, EVT_SLOT_0)
    TEXTSHOW(0xbfa)
    TEXTEND
    REMA
LABEL(0x4)
    CHECK_ALIVE(CHARACTER_GARCIA)
    BEQ(0x5, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_ROSS)
    BEQ(0x5, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_COLM)
    BEQ(0x5, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_NEIMI)
    BEQ(0x5, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_ARTUR)
    BEQ(0x5, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_LUTE)
    BEQ(0x5, EVT_SLOT_C, EVT_SLOT_0)
    TEXTSHOW(0xbfb)
    TEXTEND
    REMA
LABEL(0x5)
    CHECK_ALIVE(CHARACTER_FRANZ)
    BEQ(0x6, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_KYLE)
    BEQ(0x6, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_FORDE)
    BEQ(0x6, EVT_SLOT_C, EVT_SLOT_0)
    TEXTSHOW(0xbfc)
    TEXTEND
    REMA
LABEL(0x6)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x7, EVT_SLOT_C, EVT_SLOT_1)
    TEXTSHOW(0xbfd)
    TEXTEND
    GOTO(0x8)
LABEL(0x7)
    TEXTSHOW(0xbfe)
    TEXTEND
LABEL(0x8)
    FADI(4)
    REMA
    REVEAL(CHARACTER_LARACHEL)
    REVEAL(CHARACTER_SETH)
    ENDA
};
