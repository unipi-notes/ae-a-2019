.data
fmt:        .asciz  "%d to the power of %d is %d\n"
.text
.global main
.extern printf
main:
    push    {ip, lr}
    mov     r0, #5          @ base
    mov     r1, #4          @ power counter
    mov     r2, r0          @ multiplier
    push    {r1, r2}        @ store counter
    bl      recpow
    pop     {r1, r2}        @ restore counter
    mov     r7, r1          @ swap r1, r2
    mov     r1, r2
    mov     r2, r7
    mov     r3, r0
    ldr     r0, =fmt
    bl      printf
    pop     {ip, pc}
    mov     r7, #1
    svc     0
recpow:
    cmp     r1, #0
    bgt     else
    mov     r0, #1
    mov     pc, lr
else:
    push    {r0, lr}            @ calculate recursively
    sub     r1, r1, #1
    bl      recpow
    pop     {r2, lr}
    mul     r0, r2, r0
    mov     pc, lr
