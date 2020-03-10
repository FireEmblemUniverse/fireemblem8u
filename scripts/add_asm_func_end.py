#!/usr/bin/env python3

import sys

for filename in sys.argv[1:]:
    with open(filename, 'r+') as f:
        lines = f.readlines()
        funcEnd = ''
        for i in range(len(lines)):
            if '_FUNC_END' in lines[i] or '_func_END' in lines[i]:
                funcEnd = ''
            if '_FUNC_START' in lines[i] or '_func_start' in lines[i]:
                line = lines[i]
                if funcEnd:
                    lines[i] = funcEnd + '\n' + line
                funcEnd = line.replace('_func_start', '_func_end', 1).replace('_FUNC_START', '_FUNC_END', 1)
        if funcEnd:
            if '.align' in lines[-1]:
                lines[-1] = funcEnd + '\n' + lines[-1]
            else:
                lines.append(funcEnd)
        f.seek(0)
        f.writelines(lines)

