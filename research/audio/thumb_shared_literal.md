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

;; Test a single bit through the shift carry, preserving normal branch targets.
(define_c_enum "unspec" [UNSPEC_MATCH_THUMB_BIT])
(define_insn "match_thumb_carry_bit"
  [(set (pc)
        (if_then_else
         (match_operator 0 "equality_operator"
          [(unspec:SI [(match_operand:SI 1 "s_register_operand" "l")
                       (match_operand:SI 2 "const_int_operand" "i")]
                      UNSPEC_MATCH_THUMB_BIT)
           (const_int 0)])
         (label_ref (match_operand 3 "" ""))
         (pc)))
   (clobber (match_scratch:SI 4 "=l"))]
  "TARGET_THUMB1 && INTVAL (operands[2]) >= 0 && INTVAL (operands[2]) < 32"
{
  rtx ops[3];
  ops[0] = operands[4];
  ops[1] = operands[1];
  bool low_bit = INTVAL (operands[2]) == 0;
  ops[2] = GEN_INT (low_bit ? 1 : 32 - INTVAL (operands[2]));
  output_asm_insn (low_bit ? "lsrs\t%0, %1, %2" : "lsls\t%0, %1, %2", ops);
  bool zero = GET_CODE (operands[0]) == EQ;
  switch (get_attr_length (insn))
    {
    case 4: return zero ? "bcc\t%l3" : "bcs\t%l3";
    case 6: return zero ? "bcs\t.LCB%=\;b\t%l3\n.LCB%=:" : "bcc\t.LCB%=\;b\t%l3\n.LCB%=:";
    default: return zero ? "bcs\t.LCB%=\;bl\t%l3\n.LCB%=:" : "bcc\t.LCB%=\;bl\t%l3\n.LCB%=:";
    }
}
  [(set (attr "far_jump") (if_then_else (eq_attr "length" "8") (const_string "yes") (const_string "no")))
   (set (attr "length")
        (if_then_else
         (and (ge (minus (match_dup 3) (pc)) (const_int -250))
              (le (minus (match_dup 3) (pc)) (const_int 256)))
         (const_int 4)
         (if_then_else
          (and (ge (minus (match_dup 3) (pc)) (const_int -2040))
               (le (minus (match_dup 3) (pc)) (const_int 2048)))
          (const_int 6) (const_int 8))))
   (set_attr "type" "multiple")])
