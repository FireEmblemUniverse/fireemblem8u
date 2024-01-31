#pragma once

//AI1 helpers
#define AttackInRange				0x00
#define AttackInRange80Chance		0x01
#define AttackInRange50Chance		0x02
#define AttackInPlace				0x03
#define AttackInPlace80Chance		0x04
#define AttackInPlace50Chance		0x05
#define NoAI1						0x06
#define DoNotAttackNatasha			0x07

#define AttackIfClose				0x0C
#define MoveWithLeader				0x0D
#define HealInjuredAllies			0x0E
#define HealAllies					0x0E //Alias
#define AlternateStavesAndAttackWithoutMoving 0xF
#define ThiefActionThenEscape		0x10
#define OpenDoors					0x11
#define DemonKingAction				0x14

//AI2 helpers
#define Pursue						0x00
#define NoAI2						0x03
#define DoNotMove					0x03
#define DontMove					0x03
#define BrigandMove					0x04

#define RossMovementAI				0x0A

//AI3 helpers
#define NormalRecovery				0x00
#define DefaultRecovery				0x00
#define LowRecovery					0x01
#define AlmostNoRecovery			0x02
#define CautiousRecovery			0x03
#define NoRecovery					0x04

#define Normal						0x00
#define Reckless					0x01
#define WithoutHeed					0x02
#define Cautious					0x03


//AI4 helpers
#define DefaultAI4					0x00
#define GuardTile					0x20

#define DefaultAI					0x00,0x00
#define DoNothing					0x06,0x03
#define GuardTileAI					0x03,0x03
#define AttackInRangeAI				0x00,0x03
#define ChaseOnceApproachedAI		0x00,0x06
#define HealUnits					0x0E,0x03
#define BrigandAI					0x06,0x04
#define StealingThiefAI				0x10,0x05
#define LootingThiefAI				0x06,0x05
#define MoveWithLeaderAI			0x0D,0x03
#define NeverMoveAI					0x03,0x03,0x04,0x20
#define DemonKingAI					0x14,0x03
