#include "global.h"
#include "functions.h"
#include "variables.h"
#include "bmunit.h"
#include "soundwrapper.h"

#include "prepscreen.h"
u8 CheckSomethingSomewhere();

void PrepScreenMenu_OnPickUnits(struct ProcAtMenu* proc) {
    proc->state = 1;
    Proc_Goto(proc, 0xA);
}

void PrepScreenMenu_OnItems(struct ProcAtMenu* proc) {
    proc->state = 2;
    Proc_Goto(proc, 0xA);
}

void PrepScreenMenu_OnSupport(struct ProcAtMenu* proc) {
    proc->state = 4;
    sub_80029E8(0x37, 0x100, 0x100, 0x20, 0);
    Proc_Goto(proc, 0xA);
}

void PrepScreenMenu_OnSave(struct ProcAtMenu* proc) {
    PlaySoundEffect(0x6A);
    proc->state = 3;
    Proc_Goto(proc, 0x8);
}

int PrepScreenMenu_OnStartPress(struct ProcAtMenu* proc){	
	if(0 == proc->cur_counter)
		return 0;

	PrepSpecialChar_BlinkButtonStart();
	Proc_Goto(proc, 0xB);
	return 1;
	
}

int Prep_HasUnitDeployed()
{
    struct ProcAtMenu* proc = Proc_Find(ProcScr_AtMenu);
    if (0 == proc->cur_counter)
        return 0;
    else
        return 1;
}

void sub_8095284(ProcPtr proc)
{
    Proc_Goto(proc, 0x5);
}

#if NONMATCHING
	if(0 == CheckSomethingSomewhere()) {
		if(0 == CanPrepScreenCheckMap())
	        return 0;

        PrepSpecialChar_BlinkButtonB();
    }

    Proc_Goto(proc, 0x5);
    return 1;
#else
int PrepScreenMenu_OnBPress(struct ProcAtMenu* proc) {

    if (0 != CheckSomethingSomewhere())
        goto goto_jump;
    
    if (0 != CanPrepScreenCheckMap()) {
        PrepSpecialChar_BlinkButtonB();
    goto_jump:
        Proc_Goto(proc, 0x5);
            return 1;
    }

    return 0;
}
#endif

void PrepScreenMenu_OnCheckMap(struct ProcAtMenu* proc) {
    Proc_Goto(proc, 0x5);
}

void sub_80952CC() {}
void __malloc_unlock_1() {}

void sub_80952D4()
{
    int i;
    for (i = 0; i < 5; i++)
        gUnknown_0203E87C.unk00[i] = 0;
}

void sub_80952EC(u8 val)
{
    int i;
    for (i = 0; i < 5; i++)
        if (0 == gUnknown_0203E87C.unk00[i]) {
            gUnknown_0203E87C.unk00[i] = val;
            return;
        }
}

void sub_8095314(u8 val)
{
    int i, j;
    for (i = 0; i < 5; i++) {
        if (gUnknown_0203E87C.unk00[i] != val)
            continue;

        j = i;
        if (i <= 3) {
            while (j <= 3) {
                gUnknown_0203E87C.unk00[j] = gUnknown_0203E87C.unk00[j + 1];
                j++;
            }
        }

        gUnknown_0203E87C.unk00[4] = 0;
        break;
    }
}

int sub_8095354(int index)
{
    return gUnknown_020121CC.data[index];
}

void sub_8095364(int index, int val)
{
    gUnknown_020121CC.data[index] = val;
}

int sub_8095374()
{
    return gUnknown_020121CC.data[0x40];
}

void sub_8095384(int val)
{
    gUnknown_020121CC.data[0x40] = val;
}

int sub_8095394()
{
    if (0 == (1 & gGMData.state))
        return gUnknown_020121CC.data[0x41];
    else
        return sub_80C4088();
}

void sub_80953C0(int val)
{
    if (1 & gGMData.state)
        sub_80C409C(val);
    else
        gUnknown_020121CC.data[0x41] = val;
}

s8 IsCharacterForceDeployed(int char_id)
{
    if (0 != CheckSomethingSomewhere())
        return 0;

    if (0 != GetChapterThing())
        return 0;

    return IsCharacterForceDeployed_(char_id);
}

int sub_809541C()
{
    int i, ret = 0;
    for (i = 1; i < 0x40; i++) {
        struct Unit *unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if ((US_DEAD | US_BIT16) & unit->state)
            continue;

        if (IsCharacterForceDeployed(UNIT_CHAR_ID(unit)))
            ret++;
    }
    return ret;
}

int SomeLeftoverFunctionThatReturns0()
{
    return 0;
}

s8 IsUnitInCurrentRoster(struct Unit *unit)
{
    if ((US_DEAD | US_BIT16) & unit->state)
        return 0;

    if (0x200 & UNIT_CATTRIBUTES(unit)) {
        unit->state = 8;
        return 0;
    }

    return 1;
}
