bits 64

    section .text
    global strchr:

strchr:
    push rbp
    mov rbp, rsp

    xor rax, rax
    xor rcx, rcx

check_args:
    cmp rdi, 0          ;argv[1] == NULL
    je return_null
    cmp rsi, 0          ;argv[2] == NULL
    je return_null

while:
    mov cl, [rdi]       ;(char c == str[i])
    cmp cl, 0           ;eol no match found return null
    je return_null
	cmp cl, sil         ;check if (c == arg2(rsi))
	je end_while        ;conditional jump if below cmp == true
	inc rdi             ;increment pointer (str++)
	jmp while           ;loop

end_while:
    mov rax, rdi        ;set return value to ptr
    leave
	ret

return_null:
    mov rax, 0          ;set return value to NULL
    leave
    ret