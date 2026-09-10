;; SPDX-License-Identifier: GPL-3.0-or-later
;; Explicit private Thumb return, emitted only after strict frame/call validation.
(define_insn "match_thumb_private_return"
  [(return)
   (use (match_operand:SI 0 "register_operand" "r"))]
  "TARGET_THUMB1"
  "bx\t%0"
  [(set_attr "length" "2") (set_attr "type" "branch")])
