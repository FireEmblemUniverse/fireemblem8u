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
