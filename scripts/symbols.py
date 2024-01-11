
def from_elf(f):
    from elftools.elf.elffile import ELFFile
    from elftools.elf.sections import SymbolTableSection

    elf = ELFFile(f)
    section = elf.get_section_by_name('.symtab')

    if section == None or not isinstance(section, SymbolTableSection):
        return

    for sym in section.iter_symbols():
        if sym.entry.st_info.bind != 'STB_GLOBAL':
            continue

        yield (sym.entry.st_value, sym.name)
