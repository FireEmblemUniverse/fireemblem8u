#include "global.h"
#include "functions.h"
#include "variables.h"
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
