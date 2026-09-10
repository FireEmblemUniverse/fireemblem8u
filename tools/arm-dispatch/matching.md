;; SPDX-License-Identifier: GPL-3.0-or-later
;; Explicit late RTL operations for matching legacy ARM code. These patterns
;; are not selected by normal C expansion. The matching pass supplies them.
(define_c_enum "unspec" [UNSPEC_MATCH_ARM_READ_PC UNSPEC_MATCH_ARM_BX])

;; ARM PC reads observe this instruction's address plus eight bytes. Volatile
;; prevents reuse or motion of the position-dependent value.
(define_insn "match_arm_read_pc"
  [(set (match_operand:SI 0 "s_register_operand" "=r")
        (unspec_volatile:SI [(const_int 0)] UNSPEC_MATCH_ARM_READ_PC))]
  "TARGET_ARM"
  "mov%?\t%0, %|pc"
  [(set_attr "type" "mov_reg") (set_attr "length" "4")])

;; Unlike the ordinary ARM indirect jump, this operation honors the target's
;; low mode bit. Matching passes must account for the ARM/Thumb destination.
(define_insn "match_arm_bx"
  [(set (pc)
        (unspec:SI [(match_operand:SI 0 "s_register_operand" "r")]
                   UNSPEC_MATCH_ARM_BX))]
  "TARGET_ARM && arm_arch4t"
  "bx%?\t%0"
  [(set_attr "type" "branch") (set_attr "length" "4")])

(define_c_enum "unspec" [UNSPEC_MATCH_ARM_LITERAL])

;; Read a word from a link-time symbol address using an ARM PC-relative
;; relocation. The memory expression preserves the load's memory semantics.
(define_insn "match_arm_literal"
  [(set (match_operand:SI 0 "s_register_operand" "=r")
        (mem:SI (unspec:SI [(match_operand:SI 1 "immediate_operand" "i")]
                          UNSPEC_MATCH_ARM_LITERAL)))]
  "TARGET_ARM"
  "ldr%?\t%0, [%|pc, #:pc_g0:(%c1 - 8)]"
  [(set_attr "type" "load_4") (set_attr "length" "4")])

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

;; Late, proven byte-range decrement/store/branch bundle. The UNSPEC marks the
;; range contract; ordinary RTL expansion must never infer it for arbitrary SI.
;; The plugin accepts only a forward target conservatively within 200 bytes.
(define_c_enum "unspec" [UNSPEC_MATCH_THUMB_BYTE_DEC])
(define_insn "match_thumb_byte_dec"
  [(set (pc)
        (if_then_else
         (match_operator 2 "comparison_operator"
          [(unspec:SI [(match_operand:SI 0 "s_register_operand" "+l")]
                      UNSPEC_MATCH_THUMB_BYTE_DEC)
           (const_int 0)])
         (label_ref (match_operand 3 "" "")) (pc)))
   (set (match_dup 0) (plus:SI (match_dup 0) (const_int -1)))
   (set (match_operand:QI 1 "memory_operand" "=m")
        (truncate:QI (plus:SI (match_dup 0) (const_int -1))))]
  "TARGET_THUMB1 && (GET_CODE (operands[2]) == GT || GET_CODE (operands[2]) == LE
                     || GET_CODE (operands[2]) == GTU || GET_CODE (operands[2]) == LEU)"
  "subs\t%0, %0, #1\n\tstrb\t%0, %1\n\tb%d2\t%l3"
  [(set_attr "length" "6") (set_attr "type" "multiple")])

;; Explicit data-pool padding, distinct from the normal code NOP alignment.
(define_insn "match_thumb_zero_pool_align"
  [(unspec_volatile [(const_int 1)] VUNSPEC_ALIGN)]
  "TARGET_THUMB1"
  ".balign\t4, 0"
  [(set_attr "type" "no_insn")])

;; SPDX-License-Identifier: GPL-3.0-or-later
;; Explicit private Thumb return, emitted only after strict frame/call validation.
(define_insn "match_thumb_private_return"
  [(return)
   (use (match_operand:SI 0 "register_operand" "r"))]
  "TARGET_THUMB1"
  "bx\t%0"
  [(set_attr "length" "2") (set_attr "type" "branch")])

;; Direct Thumb terminal transfer; caller frame and destination are validated
;; by the opt-in tail-transfer pass. Linker range checks remain mandatory.
(define_predicate "match_thumb_tail_symbol" (match_code "symbol_ref"))

(define_insn "match_thumb_tail_transfer"
  [(set (pc) (match_operand:SI 0 "match_thumb_tail_symbol" "s"))]
  "TARGET_THUMB1"
  "b\t%0"
  [(set_attr "length" "2") (set_attr "type" "branch")])

;; A positive bounded counter decremented once per iteration cannot overflow.
;; Only the guarded countdown pass may select this short backward branch.
(define_c_enum "unspec" [UNSPEC_MATCH_THUMB_COUNTDOWN])
(define_insn "match_thumb_countdown"
  [(set (pc)
        (if_then_else
         (gt (unspec:SI [(match_operand:SI 0 "s_register_operand" "+l")]
                       UNSPEC_MATCH_THUMB_COUNTDOWN) (const_int 0))
         (label_ref (match_operand 1 "" "")) (pc)))
   (set (match_dup 0) (plus:SI (match_dup 0) (const_int -1)))]
  "TARGET_THUMB1"
  "subs\t%0, %0, #1\n\tbgt\t%l1"
  [(set_attr "length" "4") (set_attr "type" "multiple")])

;; Restore a single low register from the stack with flag-preserving writeback.
;; The opt-in stack-word pass proves the adjacent load and SP adjustment.
(define_insn "match_thumb_pop_word"
  [(set (match_operand:SI 0 "low_register_operand" "=l")
        (mem:SI (reg:SI SP_REGNUM)))
   (set (reg:SI SP_REGNUM)
        (plus:SI (reg:SI SP_REGNUM) (const_int 4)))]
  "TARGET_THUMB1"
  "pop\t{%0}"
  [(set_attr "length" "2") (set_attr "type" "load_4")])

;; PC-relative address materialization, selected only with a link-checked
;; symbol/offset contract. ARM reads PC as this instruction's address + 8.
(define_c_enum "unspec" [UNSPEC_MATCH_ARM_PC_ADDRESS])
(define_insn "match_arm_pc_address"
  [(set (match_operand:SI 0 "s_register_operand" "=r")
        (unspec_volatile:SI [(match_operand:SI 1 "const_int_operand" "n")]
                            UNSPEC_MATCH_ARM_PC_ADDRESS))]
  "TARGET_ARM && INTVAL (operands[1]) >= 0 && INTVAL (operands[1]) <= 255"
  "add%?\t%0, %|pc, %1"
  [(set_attr "type" "alu_imm") (set_attr "length" "4")])

;; Guarded private ARM conditional tail transfer. The late continuation pass
;; supplies the symbol and condition; link-time ARM mode/range checks are required.
(define_predicate "match_arm_tail_symbol" (match_code "symbol_ref"))
(define_c_enum "unspec" [UNSPEC_MATCH_ARM_CONDITIONAL_TAIL])
(define_insn "match_arm_cond_tail_transfer"
  [(set (pc)
        (unspec:SI [(match_operand:SI 0 "match_arm_tail_symbol" "s")
                    (match_operator 1 "arm_comparison_operator"
                      [(match_operand 2 "cc_register" "") (const_int 0)])]
                   UNSPEC_MATCH_ARM_CONDITIONAL_TAIL))]
  "TARGET_ARM"
  "b%d1\t%c0"
  [(set_attr "conds" "use") (set_attr "type" "branch")
   (set_attr "length" "4")])

;; Flags for a positive mathematical signed sum, selected only by the guarded
;; widened-add reduction. Only the immediately following GT branch may consume
;; this opaque flag value; EQ would be invalid for INT_MIN + INT_MIN.
(define_c_enum "unspec" [UNSPEC_MATCH_ARM_SIGNED_SUM_FLAGS])
(define_insn "match_arm_signed_sum_flags"
  [(set (reg:CC CC_REGNUM)
        (unspec:CC [(match_operand:SI 1 "s_register_operand" "r")
                    (match_operand:SI 2 "s_register_operand" "r")]
                   UNSPEC_MATCH_ARM_SIGNED_SUM_FLAGS))
   (set (match_operand:SI 0 "s_register_operand" "=r")
        (plus:SI (match_dup 1) (match_dup 2)))]
  "TARGET_ARM"
  "adds%?\t%0, %1, %2"
  [(set_attr "conds" "set") (set_attr "type" "alus_sreg")
   (set_attr "length" "4")])

;; Retain the shifted counter and branch on its discarded bit. The guarded
;; late pass proves a short forward target and dead copied temporary.
(define_c_enum "unspec" [UNSPEC_MATCH_THUMB_SHIFT_CARRY])
(define_insn "match_thumb_shift_carry"
  [(set (pc)
        (if_then_else
         (match_operator 0 "equality_operator"
          [(unspec:SI [(match_operand:SI 1 "s_register_operand" "+l")
                       (match_operand:SI 2 "const_int_operand" "i")]
                      UNSPEC_MATCH_THUMB_SHIFT_CARRY)
           (const_int 0)])
         (label_ref (match_operand 3 "" "")) (pc)))
   (set (match_dup 1) (lshiftrt:SI (match_dup 1) (match_dup 2)))]
  "TARGET_THUMB1 && INTVAL (operands[2]) >= 1 && INTVAL (operands[2]) <= 31"
{
  output_asm_insn ("lsrs\t%1, %1, %2", operands);
  return GET_CODE (operands[0]) == EQ ? "bcc\t%l3" : "bcs\t%l3";
}
  [(set_attr "length" "4") (set_attr "type" "multiple")])

;; Explicit flag-setting Thumb register copy. Ordinary ADD RTL also admits
;; non-flag-setting high-register forms, so preserve the low-register NZ contract.
(define_c_enum "unspec" [UNSPEC_MATCH_THUMB_ADD_ZERO])
(define_insn "match_thumb_add_zero"
  [(set (match_operand:SI 0 "s_register_operand" "=l")
        (unspec:SI [(match_operand:SI 1 "s_register_operand" "l")]
                   UNSPEC_MATCH_THUMB_ADD_ZERO))]
  "TARGET_THUMB1 && REGNO (operands[0]) != REGNO (operands[1])"
  "adds\t%0, %1, #0"
  [(set_attr "conds" "set") (set_attr "length" "2")
   (set_attr "type" "alus_imm")])

;; Compare the original signed value with one while decrementing modulo 2^32.
;; SUBS flags implement this comparison even when the result wraps at INT_MIN.
(define_insn "match_thumb_fork_decrement"
  [(set (pc)
        (if_then_else
         (le (match_operand:SI 0 "low_register_operand" "+l") (const_int 1))
         (label_ref (match_operand 1 "" "")) (pc)))
   (set (match_dup 0) (plus:SI (match_dup 0) (const_int -1)))]
  "TARGET_THUMB1"
  "subs\t%0, %0, #1\n\tble\t%l1"
  [(set_attr "length" "4") (set_attr "type" "multiple") (set_attr "conds" "clob")])
