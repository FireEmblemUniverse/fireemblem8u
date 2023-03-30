#include "global.h"
#include "bmitem.h"
#include "spellassoc.h"

struct SpellAssoc *GetSpellAssocStructPtr(u16 item)
{
    struct SpellAssoc *it = gSpellAssocData;
    u16 iid = GetItemIndex(item);
    u16 item_;

    item_ = it->item;

    if (item_ != 0xFFFF) {
        while (item_ != iid) {
            item_ = (++it)->item;
            if (item_ == 0xFFFF)
                break;
        }
    }

    return it;
}

int GetSpellAssocCharCount(u16 item)
{
    return GetSpellAssocStructPtr(item)->count;
}

u16 GetSpellAssocType(u16 item)
{
    return GetSpellAssocStructPtr(item)->type;
}

struct ProcCmd *GetSpellAssocAlt6CPointer(u16 item)
{
    return GetSpellAssocStructPtr(item)->pcmd_manim;
}

u8 GetSpellAssocReturnBool(int item)
{
    return GetSpellAssocStructPtr(item)->stat;
}

u8 GetSpellAssocFacing(u16 item)
{
    return GetSpellAssocStructPtr(item)->facing;
}

u8 GetSpellAssocFlashColor(u16 item)
{
    return GetSpellAssocStructPtr(item)->flash_color;
}
