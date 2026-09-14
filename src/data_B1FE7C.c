#include "global.h"
#include "prelude.h"

// Duplicate linked assets, serial payload/code and runtime data. Generated from
// recovered objects; see scripts/rebuild_orphan_from_objects.py. The historical
// rodata pointer is preserved for ROM fidelity; reachability remains unproven.
CONST_DATA u8 gUnkData_108[0xA788] = {
#include ".deps/orphan-rebuild/orphan.inc"
};
