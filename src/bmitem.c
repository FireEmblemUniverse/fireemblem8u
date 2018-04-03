#include "global.h"
#include "items.h"

char* GetItemNameWithArticle(int item, u8 capitalize){
  char* result;
  const char* article;
  extern const char gUnknown_080D79E0;
  extern const char gUnknown_080D79D8;
  char* itemName;
  int cap;
  int unk;

  cap = capitalize;
  switch(GetItemIndex(item)) {
    case Fimbulvetr:
    case Excalibur:
    case Fenrir:
    case Gleipnir:
    case Gold:
    case Reginleif:
    case Sieglinde:
    case Ivaldi:
    case MetissTome:
    case Latona:
    case Vidofnir:
    case Naglfar:
    case Audhulma:
    case Siegmund:
    case Garm:
    case Nidhogg:
    case Item1G:
    case Item5G:
    case Item10G:
    case Item50G:
    case Item100G:
    case Item3000G:
    case Item5000G:
    case Alacalibur:
    case Item150G:
    case Item200G:
      //no article
      result = GetItemNameString(item);
      break;
    default:
      //check for article
      if (GetItemIndex(item)==JunaFruit)
      {
        unk = (s8)cap;
        article = &gUnknown_080D79E0; //"some "
        cap = cap << 24;
        if (unk == 1) article = &gUnknown_080D79D8; //"Some "
      }
      else {
        article = 0;
        cap = cap << 24;
      }
      itemName = GetItemNameString(item);
      PrependArticleToString(itemName, article, (cap>>24));
      result = itemName;
      break;
  };
  return result;
};

s8 GetItemHPBonus(int item){
  const struct _StatBonuses* statBonus;
  const ItemData* itemData;

  if (item) {
    itemData = &gItemData[itemID(item)];
    statBonus = itemData -> pStatBonuses; //doesn't load in the right order
  }
  else return 0;
  if (statBonus){
      return statBonus->HPBonus;
  }
  else return 0;
}

s8 GetItemPowBonus(int item){
  const struct _StatBonuses* statBonus;
  const ItemData* itemData;

  if (item) {
    itemData = &gItemData[itemID(item)];
    statBonus = itemData -> pStatBonuses; //doesn't load in the right order
  }
  else return 0;
  if (statBonus){
      return statBonus->PowBonus;
  }
  else return 0;
}

s8 GetItemSklBonus(int item){
  const struct _StatBonuses* statBonus;
  const ItemData* itemData;

  if (item) {
    itemData = &gItemData[itemID(item)];
    statBonus = itemData -> pStatBonuses; //doesn't load in the right order
  }
  else return 0;
  if (statBonus){
      return statBonus->SklBonus;
  }
  else return 0;
}

s8 GetItemSpdBonus(int item){
  const struct _StatBonuses* statBonus;
  const ItemData* itemData;

  if (item) {
    itemData = &gItemData[itemID(item)];
    statBonus = itemData -> pStatBonuses; //doesn't load in the right order
  }
  else return 0;
  if (statBonus){
      return statBonus->SpdBonus;
  }
  else return 0;
}

s8 GetItemDefBonus(int item){
  const struct _StatBonuses* statBonus;
  const ItemData* itemData;

  if (item) {
    itemData = &gItemData[itemID(item)];
    statBonus = itemData -> pStatBonuses; //doesn't load in the right order
  }
  else return 0;
  if (statBonus){
      return statBonus->DefBonus;
  }
  else return 0;
}

s8 GetItemResBonus(int item){
  const struct _StatBonuses* statBonus;
  const ItemData* itemData;

  if (item) {
    itemData = &gItemData[itemID(item)];
    statBonus = itemData -> pStatBonuses; //doesn't load in the right order
  }
  else return 0;
  if (statBonus){
      return statBonus->ResBonus;
  }
  else return 0;
}

s8 GetItemLckBonus(int item){
  const struct _StatBonuses* statBonus;
  const ItemData* itemData;

  if (item) {
    itemData = &gItemData[itemID(item)];
    statBonus = itemData -> pStatBonuses; //doesn't load in the right order
  }
  else return 0;
  if (statBonus){
      return statBonus->LckBonus;
  }
  else return 0;
}

int MakeItemShort(int item){
  const ItemData* itemData;
  int max;
  int unbreakable;
  int result;

  itemData = &gItemData[itemID(item)];
  unbreakable = (itemData -> attributes) & IA_UNBREAKABLE;
  max = 0xFF;
  if (!unbreakable) max = itemData -> maxUses;
  if (unbreakable) result = 0;
  else result = max;
  return (result << 8) + itemID(item);
}
