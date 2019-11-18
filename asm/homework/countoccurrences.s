.data
str:        .asciz "a quick brown fox jumps over the lazy dog"
.equ        n, (.-str)
fmt:        .asciz "the character %c appears %d times in the string\n"
.text
.global main
main:
    ldr     r0, =str
    mov     r1, #'o'
    bl      countocc
    mov     r2, r0          @ print
    ldr     r0, =fmt
    bl      printf          @ exit
    mov     r7, #1
    svc     0
countocc:
    mov     r5, #0          @ counter
loop:
    ldrb    r4, [r0], #1    @ load char
    cmp     r4, #0
    moveq   r0, r5
    moveq   pc, lr
    cmp     r4, r1
    addeq   r5, r5, #1
    b       loop

