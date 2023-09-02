#ifndef GUARD_GBAIO_H
#define GUARD_GBAIO_H

#include "gba/types.h"
#include "gba/io_reg.h"

#define REG(type, addr) (*((type volatile *) (addr)))

#define REG_BLDCA       REG(u8,  REG_ADDR_BLDALPHA + 0)
#define REG_BLDCB       REG(u8,  REG_ADDR_BLDALPHA + 1)

#endif /* GUARD_GBAIO_H */
