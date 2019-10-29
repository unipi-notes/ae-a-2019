.data                       @ initialized data section
message:                    @ label "message"
    .asciz "hello world\n"  @ allocate a string ended with a 0 byte
len = .-message             @ create a len label containing length of "message"

.text                       @ section containing the code to run
.global _start              @ give the label "_start" external linkage
_start:                     @ main program
    mov r0, #1              @ tell SYS_WRITE to use #1 (stdout) as fd
    ldr r1, =message        @ load message label from memory into SYS_WRITE
                            @ buffer. an =x operand returns x's mem address
    ldr r2, =len            @ same as previous instruction but load "how many
                            @ bytes to write" as SYS_WRITE third argument
    mov r7, #4              @ SYS_WRITE code is 4.
    swi 0                   @ software interrupt

    mov r7, #1              @ SYS_EXIT code is 1. r7 is where svc and swi take
                            @ SYSCALL codes
    swi 0