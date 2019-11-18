.data
v:          .word 1, 2, 3, 4, 5, 6, 7, 8
fmt:        .asciz "%d,"
endl:       .asciz "\n"
.text
.global main
.extern printf
main:
    push    {ip, lr}
    mov     r0, #8
    ldr     r1, =v
    push    {lr}
    bl      filter
    push    {r0-r12, lr}        @ STAMPA CONTENUTO
    ldr     r0, =endl
    bl      printf
    pop     {r0-r12, lr}
    pop     {ip, pc}
    mov     r7, #1      @ exit
    svc     0
filter:
    mov     r2, r0
    push    {r0, r1}
loop:
    ldr     r3, [r1], #4
    tst     r3, #1
    beq     even
cont:
    push    {r0-r12, lr}        @ STAMPA CONTENUTO
    mov     r1, r3
    ldr     r0, =fmt
    bl      printf
    pop     {r0-r12, lr}
    subs    r2, #1
    popeq   {r0, r1}
    moveq   pc, lr
    b       loop
even:
    mov     r3, #0
    str     r3, [r1, #-4]
    b       cont