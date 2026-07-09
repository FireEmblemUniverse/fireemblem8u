#!/usr/bin/perl

use IPC::Cmd qw[ run ];

(@ARGV == 1)
    or die "ERROR: no map file specified.\n";
open(my $file, $ARGV[0])
    or die "ERROR: could not open file '$ARGV[0]'.\n";

my $src = 0;
my $asm = 0;
my $srcdata = 0;
my $data = 0;

my $dataBanim = 0;
my $dataSound = 0;

while (my $line = <$file>)
{
    if ($line =~ /^ \.(\w+)\s+0x[0-9a-f]+\s+(0x[0-9a-f]+) (\S+\.o)/)
    {
        my $section = $1;
        my $size = hex($2);
        my $path = $3;
        my ($dir) = $path =~ m{^(\w+)/};

        if ($section eq 'text')
        {
            if ($dir eq 'src')
            {
                $src += $size;
            }
            elsif ($dir eq 'asm')
            {
                $asm += $size;
            }
        }
        # Data progress tracks both .rodata and .data. Earlier versions only
        # counted .rodata, which ignored CONST_DATA / SECTION(".data") that is
        # decompiled into src (credited below) and the large raw blobs still
        # incbin'd from data/ (counted as remaining) -- understating how much
        # data is left, so the reported percentage did not reflect reality.
        elsif ($section eq 'rodata' or $section eq 'data')
        {
            # banim and sound are self-contained extracted subsystems,
            # each reported on its own line; keep them out of the src-vs-data
            # split so the headline percentage reflects general data
            # decompilation progress. sound/ (linked via linker_script_sound.txt)
            # is ~3.6 MB of .rodata that was previously dropped entirely because
            # its dir is neither 'src' nor 'data', leaving the data total wrong.
            if ($path =~ m{^banim/})
            {
                $dataBanim += $size;
            }
            elsif ($dir eq 'sound')
            {
                $dataSound += $size;
            }
            elsif ($dir eq 'src')
            {
                $srcdata += $size;
            }
            elsif ($dir eq 'data')
            {
                $data += $size;
            }
        }
    }
}

(my $elffname = $ARGV[0]) =~ s/\.map/.elf/;

# Note that the grep filters out all branch labels. It also requires a minimum
# line length of 5, to filter out a ton of generated symbols (like AcCn). No
# settings to nm seem to remove these symbols. Finally, nm prints out a separate
# entry for whenever a name appears in a file, not just where it's defined. uniq
# removes all the duplicate entries.
#
#
# You'd expect this to take a while, because of uniq. It runs in under a second,
# though. Uniq is pretty fast!
my $base_cmd = "nm $elffname | awk '{print \$3}' | grep '^[^_].\\{4\\}' | uniq";

# This looks for Unknown_, Unknown_, or sub_, followed by just numbers. Note that
# it matches even if stuff precedes the unknown, like sUnknown/gUnknown.
my $undoc_cmd = "grep '[Uu]nknown_[0-9a-fA-F]*\\|sub_[0-9a-fA-F]*'";

# This looks for every symbol with an address at the end of it. Some things are
# given a name based on their type / location, but still have an unknown purpose.
# For example, FooMap_EventScript_FFFFFFF.
my $partial_doc_cmd = "grep '_[0-28][0-9a-fA-F]\\{5,6\\}'";

my $count_cmd = "wc -l";

# It sucks that we have to run this three times, but I can't figure out how to get
# stdin working for subcommands in perl while still having a timeout. It's decently
# fast anyway.
my $total_syms_as_string;
(run (
    command => "$base_cmd | $count_cmd",
    buffer => \$total_syms_as_string,
    timeout => 60
))
    or die "ERROR: Error while getting all symbols: $?";

my $undocumented_as_string;
(run (
    command => "$base_cmd | $undoc_cmd | $count_cmd",
    buffer => \$undocumented_as_string,
    timeout => 60
))
    or die "ERROR: Error while filtering for undocumented symbols: $?";

my $partial_documented_as_string;
(run (
    command => "$base_cmd | $partial_doc_cmd | $count_cmd",
    buffer => \$partial_documented_as_string,
    timeout => 60
))
    or die "ERROR: Error while filtering for partial symbols: $?";

# These come from `wc -l`, so a valid result is any string of digits -- including
# "0" once everything is documented. Treat a non-numeric string (e.g. a failed
# subcommand) as the error, but accept a legitimate count of zero.
my $undocumented = $undocumented_as_string + 0;
($undocumented_as_string =~ /^\s*\d+\s*$/)
    or die "ERROR: Cannot convert string to num: '$undocumented_as_string'";

my $partial_documented = $partial_documented_as_string + 0;
($partial_documented_as_string =~ /^\s*\d+\s*$/)
	or die "ERROR: Cannot convert string to num: '$partial_documented_as_string'";

my $total_syms = $total_syms_as_string + 0;
($total_syms_as_string =~ /^\s*\d+\s*$/)
    or die "ERROR: Cannot convert string to num: '$total_syms_as_string'";

($total_syms != 0)
    or die "ERROR: No symbols found.";

my $total = $src + $asm;
my $srcPct = sprintf("%.4f", 100 * $src / $total);
my $asmPct = sprintf("%.4f", 100 * $asm / $total);

# partial_documented is double-counting the unknown_* and sub_* symbols.
$partial_documented = $partial_documented - $undocumented;

my $documented = $total_syms - ($undocumented + $partial_documented);
my $docPct = sprintf("%.4f", 100 * $documented / $total_syms);
my $partialPct = sprintf("%.4f", 100 * $partial_documented / $total_syms);
my $undocPct = sprintf("%.4f", 100 * $undocumented / $total_syms);

print "$total total bytes of code\n";
print "$src bytes of code in src ($srcPct%)\n";
print "$asm bytes of code in asm ($asmPct%)\n";
print "\n";
print "$total_syms total symbols\n";
print "$documented symbols documented ($docPct%)\n";
print "$partial_documented symbols partially documented ($partialPct%)\n";
print "$undocumented symbols undocumented ($undocPct%)\n";

print "\n";
# Every data percentage is computed against the complete data total (all ROM
# .rodata + .data: decompiled src, raw data/ blobs, and the extracted banim and
# sound subsystems) so the shares sum to 100% and the ratio is honest -- just
# like code is reported as a fraction of total code. Counting only src+data in
# the denominator hid ~6 MB of already-organized banim/sound data.
my $dataTotal = $srcdata + $data + $dataBanim + $dataSound;
($dataTotal != 0) or die "ERROR: No data sections found.\n";
my $srcDataPct = sprintf("%.4f", 100 * $srcdata / $dataTotal);
my $dataPct = sprintf("%.4f", 100 * $data / $dataTotal);
my $dataBanimPct = sprintf("%.4f", 100 * $dataBanim / $dataTotal);
my $dataSoundPct = sprintf("%.4f", 100 * $dataSound / $dataTotal);
print "$dataTotal total bytes of data\n";
print "$srcdata bytes of data in src ($srcDataPct%)\n";
print "$data bytes of data in data ($dataPct%)\n";
print "$dataBanim bytes of data in banim ($dataBanimPct%)\n";
print "$dataSound bytes of data in sound ($dataSoundPct%)\n";
# Data "extraction" = everything pulled out of the raw data/ blobs into organized
# forms (decompiled src + the banim/sound subsystems). What is left to extract is
# whatever still sits in data/; when that hits 0, extraction is 100%.
my $dataExtracted = $dataTotal - $data;
my $dataExtractPct = sprintf("%.4f", 100 * $dataExtracted / $dataTotal);
print "$dataExtracted of $dataTotal bytes of data extracted ($dataExtractPct%)\n";
