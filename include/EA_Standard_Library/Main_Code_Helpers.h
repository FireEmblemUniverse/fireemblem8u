#pragma once

#define TurnEventPlayer(eid, scr, turn) TURN(eid, scr, turn, 0, FACTION_BLUE)
#define TurnEventPlayer_(eid, scr, turn, dura) TURN(eid, scr, turn, turn + dura - 1, FACTION_BLUE)
#define TurnEventEnemy(eid, scr, turn) TURN(eid, scr, turn, 0, FACTION_RED)
#define TurnEventEnemy_(eid, scr, turn, dura) TURN(eid, scr, turn, turn + dura - 1, FACTION_RED)
#define TurnEventNPC(eid, scr, turn) TURN(eid, scr, turn, 0, FACTION_GREEN)
#define TurnEventNPC_(eid, scr, turn, dura) TURN(eid, scr, turn, turn + dura - 1, FACTION_GREEN)
#define Survive(scr, turn) TurnEventPlayer(0, scr, turn)
#define OpeningTurnEvent(scr) TurnEventPlayer(0, scr, 1)

#define CharacterEvent(eid, scr, pid1, pid2) CHAR((eid), (scr), (pid1), (pid2))
#define CharacterEvent_(eid, scr, pid1, pid2, trigg_eid) CHAR_((eid), (scr), (pid1), (pid2), (trigg_eid))
#define CharacterEventBothWays(eid, scr, pid1, pid2) CharacterEvent(eid, scr, pid1, pid2) CharacterEvent(eid, scr, pid2, pid1)

#define House(eid, scr, x, y) LOCA(eid, scr, x, y, TILE_COMMAND_VISIT)
#define Seize_(eid, scr, x, y) LOCA(eid, scr, x, y, TILE_COMMAND_SEIZE)
#define Seize(x, y) Seize_(EVFLAG_WIN, EVENT_NOSCRIPT, x, y)

#define CauseGameOverIfLordDies AFEV(0, EventScr_GameOver, EVFLAG_GAMEOVER)
#define DefeatBoss(event_scr) AFEV(EVFLAG_WIN, (event_scr), EVFLAG_DEFEAT_BOSS)
#define DefeatAll(event_scr) AFEV(EVFLAG_WIN, (event_scr), EVFLAG_DEFEAT_ALL)
#define NoFade EVBIT_T(EV_STATE_SKIPPING | EV_STATE_0002 | EV_STATE_ABORT)

#define HouseEvent(msg, bg) \
    MUSI \
    Text_BG(bg, msg) \
    MUNO \
    NoFade \
    ENDA

#define ConvoEvent(textID) \
    MUSI \
    Text(textID) \
    MUNO \
    NoFade \
    ENDA
