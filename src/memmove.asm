bits 64

    section .text
    global memmove:

memmove:
    push rbp
    mov rbp, rsp

    
    mov rax, rdi			    ;set return value
    leave
    ret