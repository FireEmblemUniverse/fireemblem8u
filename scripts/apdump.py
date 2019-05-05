#!/usr/bin/env python3

import os, sys, functools

prefix = ''

def read_int16(input):
    return int.from_bytes(input.read(2), byteorder = 'little')

def gen_2byte_expr_asm(args, comment = None):
    result = '\t.2byte '
    result += ', '.join(args)

    if comment != None:
        result += ' @ {}'.format(comment)

    result += '\n'
    return result

def gen_label_expr_asm(name, comment = None):
    result = name + ':'

    if comment != None:
        result += ' @ {}'.format(comment)

    result += '\n'
    return result

def gen_2byte_expr_ea(args, comment = None):
    result = '\tSHORT '
    result += ' '.join(args)

    if comment != None:
        result += ' // {}'.format(comment)

    result += '\n'
    return result

def gen_label_expr_ea(name, comment = None):
    result = name + ':'

    if comment != None:
        result += ' // {}'.format(comment)

    result += '\n'
    return result

class FrameData:

    def __init__(self, input):
        self.rotscale = []
        self.entries  = []
        self.gfxEntries = []

        count = read_int16(input)

        # Handle Rotation/Scaling data
        if (count & 0x8000) == 0x8000:
            count = count & 0x7FFF # RotScale count

            for i in range(count):
                alpha = read_int16(input)
                xMag = read_int16(input)
                yMag = read_int16(input)

                self.rotscale.append((alpha, xMag, yMag))

            # Reload count, as the original one was for Rot/Scale
            count = read_int16(input)

        # Handle Obj data
        for i in range(count):
            oam0 = read_int16(input)
            oam1 = read_int16(input)
            oam2 = read_int16(input)

            self.entries.append((oam0, oam1, oam2))

    def load_sheet_indices(self, input):
        # One sheet index for each OAM entry
        for i in range(len(self.entries)):
            self.gfxEntries.append(read_int16(input))

    def to_asm(self, gen_2byte_expr):
        result = ''

        if len(self.rotscale) > 0:
            result += gen_2byte_expr(['({} | 0x8000)'.format(len(self.rotscale))], 'rotscale entries')

            for alpha, xMag, yMag in self.rotscale:
                result += gen_2byte_expr(map(lambda x: '0x{:X}'.format(x), [alpha, xMag, yMag]))

        result += gen_2byte_expr([str(len(self.entries))], 'oam entries')

        i = 0

        for oam0, oam1, oam2 in self.entries:
            result += gen_2byte_expr(map(lambda x: '0x{:X}'.format(x), [oam0, oam1, oam2]), 'OAM Data #{}'.format(i))
            i += 1

        i = 0

        for gfx in self.gfxEntries:
            result += gen_2byte_expr(['0x{:X}'.format(gfx)], 'Sheet Tile #{}'.format(i))
            i += 1

        return result

    def data_size(self):
        if len(self.rotscale) > 0:
            return 4 + 6 * len(self.rotscale) + 6 * len(self.entries) + 2 * len(self.gfxEntries)

        return 2 + 6 * len(self.entries) + 2 * len(self.gfxEntries)

if __name__ == '__main__':
    if len(sys.argv) < 2:
        sys.exit("Usage: (python3) {} <input file> [label_prefix (optional)]".format(sys.argv[0]))

    fName = sys.argv[1]

    # get prefix for labels to avoid name collision if given
    if len(sys.argv) > 2:
        prefix = sys.argv[2]

    # Check for file
    if not os.path.exists(fName):
        sys.exit("Error: file `{}` does not exist".format(fName))

    # Replacing those with their ea alternatives work
    gen_2byte_expr = gen_2byte_expr_asm
    gen_label_expr = gen_label_expr_asm

    with open(fName, 'rb') as file:
        baseOffset = 0 # offset whithin file of where the ap data is located

        # All offset variables (except baseOffset) are relative to baseOffset/the Ap data origin
        # This is important because a lot of offsets within ap data are relative to other points

        offsetMap = [] # list of (offset, asm) tuples, this is used for printing things in order later

        # load header (frame table & anim table offsets)
        file.seek(baseOffset)
        frameTableOffset = read_int16(file)
        animTableOffset  = read_int16(file)

        animTableSize  = 0
        frameTableSize = 0

        # This will be used to predict the anim table size
        # As well as to predict whether to load sheet indices in frame data
        def next_smallest_offset(offset):
            """
            Given an offset, finds the smallest data offset that is still larger than the given one.
            Useful for predicting data sizes.
            """

            result = 999999 # larger than any 2 bytes can hold so it's okay

            for i in range(animTableSize):
                file.seek(baseOffset + animTableOffset + i * 2)
                value = animTableOffset + read_int16(file)

                if offset < value:
                    result = min([result, value])

            for i in range(frameTableSize):
                file.seek(baseOffset + frameTableOffset + i * 2)
                value = frameTableOffset + read_int16(file)

                if offset < value:
                    result = min([result, value])

            return result

        # Since we don't know the size of the anim table,
        # we're just going to read data as offsets up until the next data block

        while (animTableOffset + animTableSize * 2) < next_smallest_offset(animTableOffset):
            file.seek(baseOffset + animTableOffset + animTableSize * 2)
            animOffset = animTableOffset + read_int16(file)

            asm = gen_label_expr('{}anim_{}'.format(prefix, animTableSize), '+${:X}'.format(animOffset))

            # Seek to start of anim data
            file.seek(baseOffset + animOffset)

            while True:
                # First 2byte is time to display next frame
                time = read_int16(file)

                if time == 0: # the "time" is 0, which means this is an ending code
                    code = read_int16(file)

                    if code == 0xFFFF: # loop code
                        asm += '\n' + gen_2byte_expr(['0', '(-1)'], 'loop back to start')
                        break

                    elif code == 1: # kill code
                        asm += '\n' + gen_2byte_expr(['0', '1'], 'kill animated object')
                        break

                    elif code == 0: # end code (the ap will still exist, but will be inactive)
                        asm += '\n' + gen_2byte_expr(['0', '0'], 'end current animation')
                        break

                    else: # this is bad
                        asm += '\n' + gen_2byte_expr(['0', '0x{:X}'.format(code)], 'bad code')
                        break

                else: # time is not 0, which means we're actually displaying a frame
                    frame = read_int16(file)
                    asm += gen_2byte_expr(['{:2}'.format(time), '{:2}'.format(frame)])

                    # Recomputing frame table size if necessary
                    frameTableSize = max([frameTableSize, frame+1])

            offsetMap.append((
                animOffset,
                asm
            ))

            animTableSize += 1

        # Unlike with anims, we do have a pretty good guess as to the size of the frame table
        # We just had to look at which anim indices were referenced and take max+1

        # The table *might* be bigger, but since the later frames wouldn't be referenced anywhere
        # it wouldn't matter for the dump (the dump wouldn't match the source tho, unfortunately)

        for i in range(frameTableSize):
            file.seek(baseOffset + frameTableOffset + i * 2)
            frameOffset = frameTableOffset + read_int16(file)

            # Computing max possible size of frame data
            possibleSize = next_smallest_offset(frameOffset) - frameOffset

            # Loading frame data
            file.seek(baseOffset + frameOffset)
            frameData = FrameData(file)

            # If the loaded frame data size is smaller than the predicted size,
            # we can assume that that frame data also contains sheet indices

            if frameData.data_size() < possibleSize:
                frameData.load_sheet_indices(file)

            offsetMap.append((
                frameOffset,
                gen_label_expr(
                    '{}frame_{}'.format(prefix, i),
                    '+${:X}'.format(frameOffset)
                ) + frameData.to_asm(gen_2byte_expr)
            ))

        # Header asm
        offsetMap.append((
            0,
            gen_label_expr('{}motion'.format(prefix)) + gen_2byte_expr(['({0}frame_list - {0}motion)'.format(prefix), '({0}anim_list - {0}motion)'.format(prefix)], 'header')
        ))

        # Anim table asm
        offsetMap.append((
            animTableOffset,
            functools.reduce( # do I need reduce?
                lambda base, index:
                    base + gen_2byte_expr(['({0}anim_{1} - {0}anim_list)'.format(prefix, index)]),
                range(animTableSize),
                gen_label_expr('{}anim_list'.format(prefix), '+${:X}'.format(animTableOffset))
            )
        ))

        # Frame table asm
        offsetMap.append((
            frameTableOffset,
            functools.reduce( # do I need reduce?
                lambda base, index:
                    base + gen_2byte_expr(['({0}frame_{1} - {0}frame_list)'.format(prefix, index)]),
                range(frameTableSize),
                gen_label_expr('{}frame_list'.format(prefix), '+${:X}'.format(frameTableOffset))
            )
        ))

        # Print!
        for offset, asm in sorted(offsetMap, key = lambda t: t[0]):
            print(asm)
