.data
fmt:        .asciz "x: %d, y: %d, x*y: %d"
.text
.global main
.extern printf
main:
    mov     r1, #128    @ x
    mov     r2, #3      @ y
    mov     r3, #0      @ result
    mov     r4, r2      @ counter
    bl      multiply
    b       print
multiply:
    cmp     r4, #0
    moveq   pc, lr      @ return
    addgt   r3, r1      @ y > 0
    subgt   r4, #1
    sublt   r3, r1      @ y < 0
    addlt   r4, #1
    b       multiply
print:
    ldr     r0, =fmt
    push    {r4}
    bl      printf
    mov     r7, #1
    svc     0