bits 64

    section .text
    global strcasecmp:

strcasecmp:
    push rbp
    mov rbp, rsp


    mov rax, rdi			    ; set return value
    leave
    ret