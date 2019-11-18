.data
v:          .word 1, 2, 3, 4, 5, 6, 7, 8
fmt:        .asciz "Sum is %d\n"
.text
.global main
.extern printf
main:
    push    {ip, lr}
    ldr     r0, =v
    mov     r1, #8
    bl      sumvec              @ STAMPA CONTENUTO
    mov     r1, r0
    ldr     r0, =fmt
    bl      printf
    pop     {ip, pc}
    mov     r7, #1              @ exit
    svc     0
sumvec:
    mov     r2, r0
    mov     r0, #0
loop:
    ldr     r3, [r2], #4
    add     r0, r0, r3
    subs    r1, r1, #1
    moveq   pc, lr              @ return
    b       loop