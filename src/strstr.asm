bits 64

    section .text
    global strstr:

strstr:
    push rbp
    mov rbp, rsp


    mov rax, rdi			    ; set return value
    leave
    ret