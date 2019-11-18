.data
v:      .word 1,2,3,4,5,6,7,8
.equ    n, (.-v)/4
fmt:    .asciz "%d\n"
.text
.global main
main:
    push    {ip, lr}
    ldr     r0, =n      @ primo parametro numero degli elementi nel vettore
    ldr     r1, =v      @ secondo parametro indirizzo del vettore
    mov     r2, #7      @ terzo parametro fattore moltiplicativo
    bl      multipl
    ldr     r7, =n      @ stampa
    ldr     r6, =v
    bl      printv
    pop     {ip, pc}
    mov     r7, #1
    svc     0
multipl:
    ldr     r3, [r1], #4
    mul     r3, r3, r2
    str     r3, [r1, #-4]
    subs    r0, r0,   #1
    moveq   pc, lr
    b       multipl
printv:
    ldr     r1, [r6], #4
    ldr     r0, =fmt     @ load the string to print
    push    {r0-r12, lr}
    bl      printf
    pop     {r0-r12, lr}
    subs    r7, r7, #1
    moveq   pc, lr
    b       printv
