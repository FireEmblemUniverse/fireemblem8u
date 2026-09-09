"""Execute the canonical USA ColorFadeTick body under Unicorn ARM emulation."""
import hashlib
from pathlib import Path
import struct


def make_oracle(rom_path, candidate=None):
    from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM, UC_HOOK_MEM_WRITE
    from unicorn import arm_const as regs

    rom = Path(rom_path).read_bytes()
    if hashlib.sha1(rom).hexdigest() != 'c25b145e37456171ada4b0d440bf88a19f4d509f':
        raise ValueError('oracle requires the canonical USA Sacred Stones ROM')
    palette_address, component_address, step_address = struct.unpack_from('<III', rom, 0x228)
    emulator = Uc(UC_ARCH_ARM, UC_MODE_ARM)
    emulator.mem_map(0x08000000, 0x1000)
    emulator.mem_write(0x08000000, rom[:0x1000])
    if candidate is not None:
        code = Path(candidate).read_bytes()
        if not code or len(code) > 0x400 - 0x234:
            raise ValueError('candidate must fit before the isolated return sentinel')
        emulator.mem_write(0x08000234, code)
    emulator.mem_map(0x02000000, 0x40000)
    emulator.mem_map(0x03000000, 0x8000)
    stack = 0x03007000
    stop = 0x08000400
    permitted = [(palette_address, palette_address + 1024),
                 (component_address, component_address + 1536), (stack - 16, stack)]
    violations = []

    def check_write(uc, access, address, size, value, user_data):
        if not any(start <= address and address + size <= end for start, end in permitted):
            violations.append((address, size))
            uc.emu_stop()

    emulator.hook_add(UC_HOOK_MEM_WRITE, check_write)

    def execute(components, steps, palette, case_index):
        emulator.mem_write(component_address, components)
        emulator.mem_write(step_address, steps)
        emulator.mem_write(palette_address, palette)
        emulator.reg_write(regs.UC_ARM_REG_CPSR, 0x13 | ((case_index % 16) << 28))
        saved = {}
        for number in range(13):
            register = getattr(regs, 'UC_ARM_REG_R' + str(number))
            value = 0x1020304 * (number + 1)
            emulator.reg_write(register, value)
            if number >= 4:
                saved[register] = value
        emulator.reg_write(regs.UC_ARM_REG_SP, stack)
        emulator.reg_write(regs.UC_ARM_REG_LR, stop)
        emulator.emu_start(0x08000234, stop, count=100000)
        assert not violations, ('write outside expected buffers/stack', violations)
        assert emulator.reg_read(regs.UC_ARM_REG_PC) == stop, 'instruction budget exhausted'
        assert emulator.reg_read(regs.UC_ARM_REG_SP) == stack, 'stack not restored'
        for register, value in saved.items():
            assert emulator.reg_read(register) == value, 'preserved register changed'
        assert bytes(emulator.mem_read(step_address, 32)) == steps, 'fade steps changed'
        return (bytes(emulator.mem_read(component_address, 1536)),
                bytes(emulator.mem_read(palette_address, 1024)))

    return execute
