.data
fmt:        .asciz "dividend: %d, divisor: %d, quotient: %d, remainder: %d \n"
.text
.global main
.extern printf
main:
    mov     r1, #128    @ dividend
    mov     r2, #3      @ divisor
    mov     r3, #0      @ quotient
    mov     r4, #0      @ remainder
    mov     r5, r1      @ down-step from dividend
    mov     r6, #0      @ dividend*quotient
loop:
    cmp     r5, r2      @ if remainder is < than divisor
    mulle   r6, r2, r3  @ calculate remainder
    suble   r4, r1, r6
    ble     print
    add     r3, r3, #1
    sub     r5, r2
    b loop
print:
    ldr     r0, =fmt
    push    {r4}
    bl      printf
    mov     r7, #1
    svc     0