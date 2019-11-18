
.data
fmt:        .asciz  "The scalar product is %d\n"
x:          .word   1,0,3,4
.equ n,     (.-x) / 4
y:          .word   0,1,-3,1
.text
.global main
.extern printf
main:
    ldr     r0, =n          @ length
    ldr     r1, =x
    ldr     r2, =y
    bl      scalar
    mov     r1, r0
    ldr     r0, =fmt
    bl      printf
    mov     r7, #1          @ exit syscall
    svc     0
scalar:
    mov     r4, #0          @ accumulator
loop:
    ldr     r5, [r1], #4
    ldr     r6, [r2], #4
    mla     r4, r5, r6, r4  @ r = x*y+r
    subs    r0, r0, #1
    bne     loop
    mov     r0, r4          @ return accumulator
    mov     pc, lr