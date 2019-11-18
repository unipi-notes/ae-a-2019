.data
v:          .word 1, 2, 3, 4, 5, 6, 7, 8
fmt:        .asciz "Searching for %d: %d\n"
.text
.global main
.extern printf
main:
    push    {ip, lr}
    mov     r0, #8
    ldr     r1, =v
    mov     r2, #12
    bl      search              @ STAMPA CONTENUTO
    mov     r1, r2
    mov     r2, r0
    ldr     r0, =fmt
    bl      printf
    pop     {ip, pc}
    mov     r7, #1              @ exit
    svc     0
search:
    ldr     r4, [r1], #4
    cmp     r2, r4
    moveq   r0, #1              @ return 1, found
    moveq   pc, lr
    subs    r0, r0, #1
    moveq   pc, lr              @ return 0, not found
    b       search