.data
fmt: .asciz "The number is: %d\n"
array: .word 4,3,2,1    @ the array
.equ n, (.-array)/4       @ the number of bytes in the arr
                    @ divided by the number of bytes
                    @ in a word (4 bit integers)
                    @ gives us the length of array
prefix: .word 0,0,0,0

.text
.global main
.extern printf

LENGTH  .req r5
OFFSET  .req r6
PREFOFF .req r10
STRING  .req r0
NUMBER  .req r9
SUM     .req r11

@ print a vector in order
main:
    push {ip, lr}
    ldr LENGTH, =n
    ldr OFFSET, =array
    ldr PREFOFF, =prefix
    mov SUM, #0
    b loop
loop:
    ldr NUMBER, [OFFSET], #4
    ldr STRING, =fmt     @ load the string to print
    add SUM,SUM, NUMBER
    str SUM, [PREFOFF], #4
    mov r1, SUM
    bl printf
    subs LENGTH,LENGTH,#1
    bne loop
    pop {ip, pc}
    mov r7, #1      @ exit
    svc 0