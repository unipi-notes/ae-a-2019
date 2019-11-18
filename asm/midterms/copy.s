.data
v:      .word 1,2,3,4,5,6,7,8
.equ    n, (.-v)/4
w:      .word 8,7,6,5,4,3,2,1 @ deve diventare 1,2,3,4,5,6,7,8
fmt:    .asciz "%d\n"
.text
.global main
main:
    push    {ip, lr}
    ldr     r0, =n    @ primo parametro numero degli elementi nel vettore
    ldr     r1, =v      @ secondo parametro indirizzo del vettore
    ldr     r2, =w      @ terzo parametro indirizzo del secondo vettore
    bl      copia
    ldr     r7, =n      @ stampa
    ldr     r6, =w
    bl      printv
    pop     {ip, pc}
    mov     r7, #1
    svc     0
copia:
    ldr     r3, [r1], #4
    str     r3, [r2], #4
    subs    r0, r0,   #1
    moveq   pc, lr
    b       copia
printv:
    ldr     r1, [r6], #4
    ldr     r0, =fmt     @ load the string to print
    push    {r0-r12, lr}
    bl      printf
    pop     {r0-r12, lr}
    subs    r7, r7, #1
    moveq   pc, lr
    b       printv
