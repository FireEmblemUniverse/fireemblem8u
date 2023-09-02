#ifndef GUARD_CP_SCRIPT_H
#define GUARD_CP_SCRIPT_H

enum
{
    AI_CMD_CONDITIONAL            = 0x00,
    AI_CMD_CALL_FUNC              = 0x01,
    AI_CMD_SET_AI                 = 0x02,
    AI_CMD_GOTO                   = 0x03,
    AI_CMD_ACTION_ON_CHAR         = 0x04,
    AI_CMD_ACTION                 = 0x05,
    AI_CMD_NOP                    = 0x06,
    AI_CMD_ACTION_IN_PLACE        = 0x07,
    AI_CMD_ACTION_ON_CLASS        = 0x08,
    AI_CMD_STAFF_ACTION           = 0x09,
    AI_CMD_STAFF_ACTION_2         = 0x0A,
    AI_CMD_STAFF_ACTION_3         = 0x0B,
    AI_CMD_MOVE_TOWARDS           = 0x0C,
    AI_CMD_MOVE_TOWARDS_CHAR      = 0x0D,
    AI_CMD_NOP_0E                 = 0x0E,
    AI_CMD_MOVE_TOWARDS_CLASS     = 0x0F,
    AI_CMD_PILLAGE                = 0x10,
    AI_CMD_MOVE_TO_SAFETY         = 0x11,
    AI_CMD_MOVE_TO_ENEMY          = 0x12,
    AI_CMD_MOVE_TO_ENEMY_2        = 0x13,
    AI_CMD_NOP_14                 = 0x14,
    AI_CMD_NOP_15                 = 0x15,
    AI_CMD_MOVE_RANDOM            = 0x16,
    AI_CMD_ESCAPE                 = 0x17,
    AI_CMD_ATTACK_WALLS           = 0x18,
    AI_CMD_MOVE_TO_TERRAIN        = 0x19,
    AI_CMD_MOVE_TO_LISTED_TERRAIN = 0x1A,
    AI_CMD_1B                     = 0x1B,
    AI_CMD_LABEL                  = 0x1C,

    AI_CMD_COUNT                  = 0x1D,
};

struct AiScr
{
    /* 00 */ u8 cmd;
    /* 01 */ u8 unk_01;
    /* 02 */ u8 unk_02;
    /* 03 */ u8 unk_03;
    /* 04 */ u32 unk_04;
    /* 08 */ const void* unk_08;
    /* 0C */ const void* unk_0C;
};

typedef s8(*AiScrFunc)(const void* arg);

s8 AiTryExecScriptA(void);
s8 AiExecFallbackScriptA(void);
s8 AiTryExecScriptB(void);
s8 AiExecFallbackScriptB(void);
// ??? AiScript_Exec(???);
// ??? AiScriptCmd_00_ConditionalGoto(???);
// ??? AiScriptCmd_01_FunctionCall(???);
// ??? AiScriptCmd_02_ChangeAi(???);
// ??? AiScriptCmd_03_Goto(???);
s8 AiIsUnitEnemy(struct Unit* unit);
// ??? AiIsUnitNonActive(???);
// ??? AiIsUnitEnemyAndNotInScrList(???);
// ??? AiIsUnitEnemyOrInScrList(???);
// ??? AiIsUnitEnemyAndScrCharId(???);
// ??? AiIsUnitEnemyAndScrClassId(???);
// ??? AiScriptCmd_04_ActionOnSelectedCharacter(???);
// ??? AiScriptCmd_05_DoStandardAction(???);
// ??? AiScriptCmd_06_DoNothing(???);
// ??? AiScriptCmd_07_DoStandardActionNoMove(???);
// ??? AiScriptCmd_08_DoStandardActionAgainstClass(???);
// ??? AiScriptCmd_09_DoStaffAction(???);
// ??? AiScriptCmd_0A_DoStaffAction(???);
// ??? AiScriptCmd_0B_DoStaffAction(???);
// ??? AiScriptCmd_0C_MoveTowardsSetPoint(???);
// ??? AiScriptCmd_0D_MoveTowardsCharacterUntilInRange(???);
// ??? AiScriptCmd_0E_DoNothing(???);
// ??? AiScriptCmd_0F_MoveTowardsUnitWithClass(???);
// ??? AiScriptCmd_10_DoLooting(???);
// ??? AiScriptCmd_11_MoveTowardsSafety(???);
// ??? AiScriptCmd_12_MoveTowardsEnemy(???);
// ??? AiScriptCmd_13(???);
// ??? AiScriptCmd_14_DoNothing(???);
// ??? AiScriptCmd_15_DoNothing(???);
// ??? AiScriptCmd_16_RandomMovement(???);
// ??? AiScriptCmd_17_DoEscape(???);
// ??? sub_803CF60(???);
// ??? sub_803CFB4(???);
// ??? sub_803D124(???);
// ??? AiScriptCmd_18_TryAttackSnagWall(???);
// ??? AiScriptCmd_19_MoveTowardsTerrain(???);
// ??? AiScriptCmd_1A_MoveTowardsTerrain(???);
// ??? AiScriptCmd_1B_NoOp(???);
void AiDoBerserkAction(void);
void AiDoBerserkMove(void);
// ??? sub_803D43C(???);
// ??? sub_803D440(???);

#define AI_CONDITIONAL(target, cond, left, right) { AI_CMD_CONDITIONAL, (cond), -1, (target), (right), (left), NULL }
#define AI_CALL_FUNC(func, argptr)       { AI_CMD_CALL_FUNC, 0, -1, 0, 0, (func), (argptr) }
#define AI_SET_AI(ai1, ai2)              { AI_CMD_SET_AI, (ai1), (ai2), 0, 0, NULL, NULL }
#define AI_GOTO(target)                  { AI_CMD_GOTO, 0, -1, (target), 0, NULL, NULL }
#define AI_ACTION_ON_CHAR(chance, charId) { AI_CMD_ACTION_ON_CHAR, (chance), -1, 0, (charId), NULL, NULL }
#define AI_ACTION_IGNORING(chance, list) { AI_CMD_ACTION, (chance), -1, 0, 0, (list), NULL }
#define AI_NOP                           { AI_CMD_NOP, 0, -1, 0, 0, NULL, NULL }
#define AI_ACTION_IN_PLACE(chance)       { AI_CMD_ACTION_IN_PLACE, (chance), -1, 0, 0, NULL, NULL }
#define AI_BAD_LABEL(id) /* bugged! */   { AI_CMD_STAFF_ACTION_3, (id), 0, 0, 0, NULL, NULL }
#define AI_MOVE_TOWARDS(x, y)            { AI_CMD_MOVE_TOWARDS, (x), -1, (y), 0, NULL, NULL }
#define AI_MOVE_TOWARDS_CHAR(charId)     { AI_CMD_MOVE_TOWARDS_CHAR, 0, -1, 0, (charId), NULL, NULL }
#define AI_NOP_0E                        { AI_CMD_NOP_0E, 0, -1, 0, 0, NULL, NULL }
#define AI_PILLAGE                       { AI_CMD_PILLAGE, 0, -1, 0, 0, NULL, NULL }
#define AI_MOVE_TO_ENEMY_IGNORING(list)  { AI_CMD_MOVE_TO_ENEMY, 0, -1, 0, 0, (list), NULL }
#define AI_MOVE_TO_ENEMY_2               { AI_CMD_MOVE_TO_ENEMY_2, 0, -1, 0, 0, NULL, NULL }
#define AI_MOVE_RANDOM                   { AI_CMD_MOVE_RANDOM, 0, -1, 0, 0, NULL, NULL }
#define AI_ESCAPE                        { AI_CMD_ESCAPE, 0, -1, 0, 0, NULL, NULL }
#define AI_ATTACK_WALLS                  { AI_CMD_ATTACK_WALLS, 0, -1, 0, 0, NULL, NULL }
#define AI_MOVE_TO_LISTED_TERRAIN(list)  { AI_CMD_MOVE_TO_LISTED_TERRAIN, 0, -1, 0, 0, (list), NULL }
#define AI_LABEL(id)                     { AI_CMD_LABEL, 0, -1, (id), 0, NULL, NULL }

#define AI_GOTO_IFGT(target, left, right) AI_CONDITIONAL(target, AI_COMPARE_GT, left, right)
#define AI_GOTO_IFGE(target, left, right) AI_CONDITIONAL(target, AI_COMPARE_GE, left, right)
#define AI_GOTO_IFEQ(target, left, right) AI_CONDITIONAL(target, AI_COMPARE_EQ, left, right)
#define AI_GOTO_IFLE(target, left, right) AI_CONDITIONAL(target, AI_COMPARE_LE, left, right)
#define AI_GOTO_IFLT(target, left, right) AI_CONDITIONAL(target, AI_COMPARE_LT, left, right)
#define AI_GOTO_IFNE(target, left, right) AI_CONDITIONAL(target, AI_COMPARE_NE, left, right)
#define AI_SET_AI1(ai1) AI_SET_AI(ai1, -1)
#define AI_SET_AI2(ai2) AI_SET_AI(-1, ai2)
#define AI_GOTO_START AI_GOTO(0)
#define AI_ACTION(chance) AI_ACTION_IGNORING(chance, NULL)
#define AI_MOVE_TO_ENEMY  AI_MOVE_TO_ENEMY_IGNORING(NULL)

#endif // GUARD_CP_SCRIPT_H