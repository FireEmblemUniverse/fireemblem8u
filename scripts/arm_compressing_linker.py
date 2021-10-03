#!/usr/bin/env python3

# a simple arm linker with following features:
# 1. support to compress section including realloc
# 2. use external compressor and toolchain
# 3. link both object file and raw binary

# author: https://github.com/laqieer

import os
import sys
import getopt

def rreplace(self, old, new, *max):
    count = len(self)
    if max and str(max[0]).isdigit():
        count = max[0]
    return new.join(self.rsplit(old, count))

def parse_linker_script(filename):
    obj_list = []
    with open(filename, 'r') as f:
        text = f.readlines()
    for line in text:
        if line[0] not in ('#', '\n'):
            if ">" in line:
                obj_sec, comp = line.split(">")
                obj_sec = obj_sec.strip()
                comp = comp.strip()
            else:
                obj_sec = line.strip()
                comp = None
            if "|" in obj_sec:
                obj, sec = obj_sec.split("|")
                obj = obj.strip()
                sec = sec.strip()
            else:
                obj = obj_sec
                sec = '.data'
            obj_list.append((obj, sec, comp))
    return obj_list

def convert_binary_to_object(filename, objcopy, is_debug):
    label = os.path.basename(filename).split(".")
    # omit extension name .4bpp
    if label[1] == '4bpp':
        label = label[0]
    else:
        label = label[0] + '_' + label[1]
    cmd = '%s -I binary -O elf32-littlearm -B armv4t --add-symbol %s=.data:0 %s %s.o' \
        % (objcopy, label, filename, filename)
    if is_debug:
        print(cmd)
    os.system(cmd)
    return filename + '.o'

def is_binary(filename):
    return os.path.splitext(filename)[-1] not in ('.o', '.obj', '.elf')

def compress_binary(filename, comptype, compressor, is_debug):
    cmd = '%s %s %s' % (compressor, filename, comptype)
    if is_debug:
        print(cmd)
    os.system(cmd)
    return filename + '.' + comptype

def link_first_object(outputfile, filename, base_addr, ld, is_debug):
    cmd = '%s -e 0x%X -Tdata 0x%X -o %s %s' % (
        ld, base_addr, base_addr,outputfile, filename)
    if is_debug:
        print(cmd)
    os.system(cmd)

def link_to_output(outputfile, filename, section, base_addr, ld,
                   is_merge, is_debug):
    if is_merge:
        unique_section = ''
    else:
        unique_section = ' --unique=%s' % section
    cmd = 'cp %s %s.bak.o' % (outputfile, outputfile)
    if is_debug:
        print(cmd)
    os.system(cmd)
    cmd = '%s --no-warn-mismatch -e 0x%X -Tdata 0x%X%s -o %s %s.bak.o %s' % (
        ld, base_addr, base_addr, unique_section, outputfile, outputfile,
        filename)
    if is_debug:
        print(cmd)
    os.system(cmd)

def dump_binary_from_object(filename, section, objcopy, is_debug):
    index = filename.rfind(".")
    n_sec = section
    if n_sec[0] != '.':
        n_sec = '.' + section
    if n_sec[-1] != '.':
        n_sec = section + '.'
    bin_name = filename[:index] + n_sec + 'bin'
    cmd = '%s -O binary -j %s %s %s' % (objcopy, section, filename, bin_name)
    if is_debug:
        print(cmd)
    os.system(cmd)
    return bin_name

def remove_section_in_object(filename, section, objcopy, is_debug):
    cmd = 'cp %s %s.bak.o' % (filename, filename)
    if is_debug:
        print(cmd)
    os.system(cmd)
    cmd = '%s -O elf32-littlearm -B armv4t -R %s %s.bak.o %s' % (
        objcopy, section, filename, filename)
    if is_debug:
        print(cmd)
    os.system(cmd)

def process_first_object(filename, section, objcopy, comptype, compressor,
                         is_debug):
    if is_binary(filename):
        if comptype is not None:
            filename = compress_binary(filename, comptype, compressor, is_debug)
        filename = convert_binary_to_object(filename, objcopy, is_debug)
    else:
        if comptype is not None:
            filename = dump_binary_from_object(filename, section, objcopy,
                                               is_debug)
            filename = compress_binary(filename, comptype, compressor, is_debug)
            filename = convert_binary_to_object(filename, objcopy, is_debug)
    return filename

def process_input_object(filename, outputfile, section, base_addr, ld, objcopy,
                         comptype, compressor, is_debug):
    if is_binary(filename):
        if comptype is not None:
            filename = compress_binary(filename, comptype, compressor, is_debug)
        filename = convert_binary_to_object(filename, objcopy, is_debug)
    else:
        if comptype is not None:
            cmd = 'cp %s %s.bak.o' % (outputfile, outputfile)
            if is_debug:
                print(cmd)
            os.system(cmd)
            link_to_output(outputfile + '.bak.o', filename, section, base_addr,
                           ld, False, is_debug)
            filename_2 = dump_binary_from_object(outputfile + '.bak.o',
                                                 section, objcopy, is_debug)
#            cmd = 'mv %s.bak.o %s' % (outputfile, outputfile)
#            if is_debug:
#                print(cmd)
#            os.system(cmd)
#            remove_section_in_object(outputfile, section, objcopy, is_debug)
            filename = filename + '.bin'
            cmd = 'cp %s %s' % (filename_2, filename)
            if is_debug:
                print(cmd)
            os.system(cmd)
            filename = compress_binary(filename, comptype, compressor, is_debug)
            filename = convert_binary_to_object(filename, objcopy, is_debug)
    return filename

def link_objects(obj_list, outputfile, base_addr,
                 ld, objcopy, compressor, is_debug):
#    os.mkdir('link_temp')
#    os.chdir('link_temp')
    # handle the first object
    total_number = len(obj_list)
    filename = obj_list[0][0]
    comptype = obj_list[0][2]
    section = obj_list[0][1]
    print('Compressing linking (1/%d): %s' % (total_number, filename))
    filename = process_first_object(filename, section, objcopy,
                                    comptype, compressor, is_debug)
    link_first_object(outputfile, filename, base_addr, ld, is_debug)
    # link other objects
    for i, obj in enumerate(obj_list[1:]):
        print('Compressing linking (%d/%d): %s'
              % (i + 2, total_number, filename))
        filename = obj[0]
        comptype = obj[2]
        section = obj[1]
        filename = process_input_object(filename, outputfile, section,
                                        base_addr, ld, objcopy,
                                        comptype, compressor, is_debug)
        link_to_output(outputfile, filename, section, base_addr, ld, True,
                       is_debug)
#    cmd = 'cp %s ../%s' % (outputfile, outputfile)
#    if is_debug:
#        print(cmd)
#    os.system(cmd)
#    os.chdir('../')
#    os.rmdir('link_temp')

def main(argv):
    outputfile = 'out.o'
    ld = 'arm-none-eabi-ld'
    objcopy = ''
    compressor = ''
    linker_script = 'linker_script.txt'
    base_addr = 0
    is_debug = False
    is_dependency = False
    try:
        opts, args = getopt.getopt(argv, "ho:l:c:t:b:dm",
                                   ["help", "output=", "script=", "base=",
                                    "ld=", "objcopy=", "compressor=", "debug",
                                    "dependency"])
    except getopt.GetoptError:
        print('Error: wrong option. Use -h for help information.')
        sys.exit(1)
    for opt, arg in opts:
        if opt in ('-h', '--help'):
            print('options:\n')
            print('\t-h, --help\tPrint a summary of the command-line options \
on the standard output and exit.\n')
            print('\t-o, --output <file>\tSet the output file. \
Default: out.o\n')
            print('\t-t, --script <file>\tSet the linker script. \
Default: linker_script.txt.\n')
            print('\t-b, --base <address>\tSet the base address (Hexadecimal) \
. Default: 0.')
            print('\t-l, --ld <program>\tSet the ld. \
Default: arm-none-eabi-ld.\n')
            print('\t--objcopy <program>\tSet the objcopy. \
Default: arm-none-eabi-objcopy. \
Defaul to use objcopy in the same toolchain if ld is set with -l or --ld.\n')
            print('\t-c, --compressor <program>\tSet the compressor. \
Default: compressor.py.\n')
            print('\t-d, --debug\tEnable debug infomation output.\n')
            print('\t-m, --dependency\tOutput dependency from linker script \
for makefile.\n')
            sys.exit()
        elif opt in ('-o', '--output'):
            outputfile = arg
        elif opt in ('-t', '--script'):
            linker_script = arg
        elif opt in ('-l', '--ld'):
            ld = arg
        elif opt == '--objcopy':
            objcopy = arg
        elif opt in ('-c', '--compressor'):
            compressor = arg
        elif opt in ('-b', '--base'):
            base_addr = int(arg, 16)
        elif opt in ('-d', '--debug'):
            is_debug = True
        elif opt in ('-m', '--dependency'):
            is_dependency = True
    obj_list = parse_linker_script(linker_script)
    if is_dependency:
        s = []
        for obj in obj_list:
            s.append(obj[0])
        print(" ".join(s))
        sys.exit()
    if objcopy == '':
        objcopy = rreplace(ld, 'ld', 'objcopy', 1)
    if os.path.exists(outputfile):
        os.remove(outputfile)
    link_objects(obj_list, outputfile, base_addr, ld, objcopy, compressor,
                 is_debug)


if __name__ == "__main__":
    if len(sys.argv) == 1:
        argv = ['-h']
    else:
        argv = sys.argv[1:]
    main(argv)

