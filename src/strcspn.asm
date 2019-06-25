bits 64

    section .text
    global strcspn:

strcspn:
    push rbp
    mov rbp, rsp

    xor rax, rax
    xor rcx, rcx                ; i = 0
    xor rdx, rdx                ; j = 0

while:
    cmp byte [rdi + rcx], 0     ; if str1[i] == '\0'
    je return_null
    jmp inside_while

inside_while:
    cmp byte [rsi + rdx], 0     ; if str2[j] == '\0'
    je end_inside_while
    mov r8b, [rdi + rcx]        ; char c = str2[j]
    cmp byte [rsi + rdx], r8b   ; if str1[i] == c
    je end_while
    inc rdx                     ; j++
    jmp inside_while

end_inside_while:
    inc rcx                     ; i++
    inc rdx                     ; j++
    jmp while

end_while:
    mov rax, rcx                ; set return value
    leave
    ret

return_null:
    mov rax, 0
    leave
    ret