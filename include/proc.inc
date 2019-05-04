
.macro PROC_END
	.2byte 0x00
    .2byte 0
    .4byte 0
.endm

.macro PROC_SET_NAME aName
	.2byte 0x01
	.2byte 0
	.4byte \aName
.endm

.macro PROC_CALL_ROUTINE apRoutine
	.2byte 0x02
	.2byte 0
	.4byte \apRoutine
.endm

.macro PROC_LOOP_ROUTINE apRoutine
	.2byte 0x03
	.2byte 0
	.4byte \apRoutine
.endm

.macro PROC_SET_DESTRUCTOR apRoutine
	.2byte 0x04
	.2byte 0
	.4byte \apRoutine
.endm

.macro PROC_NEW_CHILD ap6CChild
	.2byte 0x05
	.2byte 0
	.4byte \ap6CChild
.endm

.macro PROC_NEW_CHILD_BLOCKING ap6CChild
	.2byte 0x06
	.2byte 0
	.4byte \ap6CChild
.endm

.macro PROC_NEW_MAIN_BUGGED ap6CMain
	.2byte 0x07
	.2byte 0
	.4byte \ap6CMain
.endm

.macro PROC_WHILE_EXISTS ap6CToCheck
	.2byte 0x08
	.2byte 0
	.4byte \ap6CToCheck
.endm

.macro PROC_END_ALL ap6CToCheck
	.2byte 0x09
	.2byte 0
	.4byte \ap6CToCheck
.endm

.macro PROC_BREAK_ALL_LOOP ap6CToCheck
	.2byte 0x0A
	.2byte 0
	.4byte \ap6CToCheck
.endm

.macro PROC_LABEL aLabelId
	.2byte 0x0B
    .2byte \aLabelId
    .4byte 0
.endm

.macro PROC_GOTO aLabelId
	.2byte 0x0C
    .2byte \aLabelId
    .4byte 0
.endm

.macro PROC_JUMP ap6CCode
	.2byte 0x0D
	.2byte 0
	.4byte \ap6CCode
.endm

.macro PROC_SLEEP aTime
	.2byte 0x0E
    .2byte \aTime
    .4byte 0
.endm

.macro PROC_SET_MARK aMark
	.2byte 0x0F
    .2byte \aMark
    .4byte 0
.endm

.macro PROC_BLOCK
	.2byte 0x10
	.2byte 0
	.4byte 0
.endm

.macro PROC_END_IF_DUPLICATE
	.2byte 0x11
	.2byte 0
	.4byte 0
.endm

.macro PROC_SET_BIT4
	.2byte 0x12
	.2byte 0
	.4byte 0
.endm

.macro PROC_13
	.2byte 0x13
	.2byte 0
	.4byte 0
.endm

.macro PROC_WHILE_ROUTINE aprRoutine
	.2byte 0x14
	.2byte 0
	.4byte \aprRoutine
.endm

.macro PROC_15
	.2byte 0x15
	.2byte 0
	.4byte 0
.endm

.macro PROC_CALL_ROUTINE_2 aprRoutine
	.2byte 0x16
	.2byte 0
	.4byte \aprRoutine
.endm

.macro PROC_END_DUPLICATES
	.2byte 0x17
	.2byte 0
	.4byte 0
.endm

.macro PROC_CALL_ROUTINE_ARG aprRoutine, aArgument
	.2byte 0x18
    .2byte \aArgument
    .2byte \aprRoutine
.endm

.macro PROC_19
	.2byte 0x19
	.2byte 0
	.4byte 0
.endm

.macro PROC_YIELD
    PROC_SLEEP 0
.endm
