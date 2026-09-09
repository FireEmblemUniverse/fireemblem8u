"""Regression checks for distinguishing executable assembly from annotations."""
import unittest

from audit_decomp import classify_inline_assembly


class InlineAssemblyClassificationTests(unittest.TestCase):
    def classify(self, source, line=1):
        return classify_inline_assembly(source, {
            "path": "fixture.c", "line": line,
            "source": source.splitlines()[line - 1],
        })

    def test_register_binding(self):
        self.assertEqual(self.classify('register int x asm("r2");')["kind"], "register_binding")

    def test_empty_constraint(self):
        self.assertEqual(self.classify('asm("" : "+r"(x));')["kind"], "empty_template")

    def test_multiline_adjacent_literals(self):
        site = self.classify('asm volatile(\n ".syntax unified\\n"\n "subs %0, %0, %1\\n"\n "bgt 1b" : "+l"(x) : "l"(y));')
        self.assertEqual(site["kind"], "instruction_template")
        self.assertEqual(site["template"], '.syntax unified\nsubs %0, %0, %1\nbgt 1b')

    def test_line_continuation(self):
        site = self.classify('asm("\\n\\\n mov r2, pc\\n\\\n");')
        self.assertEqual(site["kind"], "instruction_template")
        self.assertIn('mov r2, pc', site["template"])

    def test_directives(self):
        self.assertEqual(self.classify('asm(".section .text.after, \\"ax\\", %progbits");')["kind"], "directive_only")

    def test_macro_template_is_not_assumed_empty(self):
        self.assertEqual(self.classify('asm(ASM_TEMPLATE);')["kind"], "unresolved")
        self.assertEqual(self.classify('asm("prefix" ASM_TEMPLATE);')["kind"], "unresolved")

    def test_comments_between_literals_and_line_offset(self):
        site = self.classify('void f(void) {\n asm("mov " /* join */ "r2, pc");\n}', 2)
        self.assertEqual(site["template"], 'mov r2, pc')


if __name__ == '__main__':
    unittest.main()
