;; SPDX-License-Identifier: GPL-3.0-or-later
;; External Thumb word load. The scaled implicit REL addend represents -4.
;; Link-time forward range assertions are required; R_ARM_THM_PC8 can wrap.
(define_c_enum "unspec" [UNSPEC_MATCH_THUMB_LITERAL])
(define_insn "match_thumb_literal"
  [(set (match_operand:SI 0 "s_register_operand" "=l")
        (unspec_volatile:SI [(match_operand:SI 1 "" "X")]
                            UNSPEC_MATCH_THUMB_LITERAL))]
  "TARGET_THUMB1 && GET_CODE (operands[1]) == SYMBOL_REF"
  "ldr\t%0, [pc, #1020]\n\t.reloc .-2, R_ARM_THM_PC8, %c1"
  [(set_attr "type" "load_4") (set_attr "length" "2")])
