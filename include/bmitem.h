#ifndef GUARD_ITEMS_H
#define GUARD_ITEMS_H

enum {
	IA_NONE           = 0,

	IA_WEAPON         = (1 << 0),
	IA_MAGIC          = (1 << 1),
	IA_STAFF          = (1 << 2),
	IA_UNBREAKABLE    = (1 << 3),
	IA_UNSELLABLE     = (1 << 4),
	IA_BRAVE          = (1 << 5),
	IA_MAGICDAMAGE    = (1 << 6),
	IA_UNCOUNTERABLE  = (1 << 7),
	IA_REVERTTRIANGLE = (1 << 8),
	IA_HAMMERNE       = (1 << 9), // Defined as Hammerne effect in FE6 Nightmare module, but as ??? in FE7 & FE8.
	IA_LOCK_3         = (1 << 10), // Dragons or Monster depending of game
	IA_LOCK_1         = (1 << 11),
	IA_LOCK_2         = (1 << 12),
	IA_LOCK_0         = (1 << 13), // King in FE6
	IA_NEGATE_FLYING  = (1 << 14),
	IA_NEGATE_CRIT    = (1 << 15),
	IA_UNUSABLE       = (1 << 16),
	IA_NEGATE_DEFENSE = (1 << 17),
	IA_LOCK_4         = (1 << 18),
	IA_LOCK_5         = (1 << 19),
	IA_LOCK_6         = (1 << 20),
	IA_LOCK_7         = (1 << 21),

	// Helpers
	IA_LOCK_ANY = (IA_LOCK_0 | IA_LOCK_1 | IA_LOCK_2 | IA_LOCK_3 | IA_LOCK_4 | IA_LOCK_5 | IA_LOCK_6 | IA_LOCK_7 | IA_UNUSABLE)
};

char* GetItemNameWithArticle(int item, s8 capitalize);
int GetItemHPBonus(int item);
int GetItemPowBonus(int item);
int GetItemSklBonus(int item);
int GetItemSpdBonus(int item);
int GetItemDefBonus(int item);
int GetItemResBonus(int item);
int GetItemLckBonus(int item);
int MakeItemShort(int item);

#endif // GUARD_ITEMS_H