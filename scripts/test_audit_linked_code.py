#!/usr/bin/env python3
"""Regression checks for input-section ownership and instruction mappings."""
import unittest
from audit_linked_code import partition, read_contributions, read_mappings


class LinkedCodeAuditTests(unittest.TestCase):
    def test_single_and_wrapped_input_sections(self):
        text = (' .text 0x08000000 0x10 src/a.o\n'
                ' .text.after_handler\n'
                '                0x08000010 0x8 src/a.o\n'
                ' .data 0x08000018 0x4 asm/wrapper.o\n'
                ' .text 0x00000000 0x10 discarded.o\n')
        sections = read_contributions(text)
        self.assertEqual([x['section'] for x in sections], ['.text', '.text.after_handler', '.data'])
        self.assertEqual(sections[-1]['object'], 'asm/wrapper.o')

    def test_mapping_does_not_leak_across_objects(self):
        sections = [dict(start=0x08000000, end=0x08000008, section='.text', object='a.o'),
                    dict(start=0x08000008, end=0x08000010, section='.data', object='b.o')]
        regions = partition(sections, {0x08000000: 'thumb', 0x08000004: 'data'})
        self.assertEqual([(x['kind'], x['size']) for x in regions],
                         [('thumb', 4), ('data', 4), ('unmapped', 8)])

    def test_arm_code_in_data_section_is_not_discarded(self):
        section = dict(start=0x08001000, end=0x08001010, section='.data', object='wrapper.o')
        regions = partition([section], {0x08001000: 'arm', 0x08001008: 'data'})
        self.assertEqual(regions[0]['kind'], 'arm')
        self.assertEqual(regions[0]['size'], 8)

    def test_mapping_suffixes_and_duplicate_same_kind(self):
        text = ('1: 08000000 0 NOTYPE LOCAL DEFAULT 11 $t\n'
                '2: 08000000 0 NOTYPE LOCAL DEFAULT 11 $t.1\n'
                '3: 08000004 0 NOTYPE LOCAL DEFAULT 11 $d\n')
        self.assertEqual(read_mappings(text), {0x08000000: 'thumb', 0x08000004: 'data'})

    def test_conflicts_and_overlaps_fail(self):
        with self.assertRaises(ValueError):
            read_mappings('1: 08000000 0 NOTYPE LOCAL DEFAULT 11 $t\n'
                          '2: 08000000 0 NOTYPE LOCAL DEFAULT 11 $d\n')
        with self.assertRaises(ValueError):
            read_contributions(' .text 0x08000000 0x10 a.o\n .data 0x08000008 0x10 b.o\n')


if __name__ == '__main__':
    unittest.main()
