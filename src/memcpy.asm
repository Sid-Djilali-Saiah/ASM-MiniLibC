bits 64

    section .text
    global memcpy:

memcpy:
    push rbp
    mov rbp, rsp

    xor rcx, rcx			    ; i = 0
    jmp check

while:
    mov al, byte [rsi + rcx]    ; char c = src[i]
    mov byte [rdi + rcx], al    ; dest[i] = c
    inc rcx                     ; i++

check:
    cmp rdx, rcx                ; check if n > i
    jg while

end_while:
    mov rax, rdi			    ;set return value
    leave
    ret