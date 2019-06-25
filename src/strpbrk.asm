bits 64

    section .text
    global strpbrk:

strpbrk:
	push rbp
	mov rbp, rsp

	xor rax, rax

while:
	cmp byte[rdi], 0        ; if str == NULL
	je return_null
	mov r8, rsi             ; create a cpy of str1

inside_while:
	mov al, [r8]            ; char c = str1[i]
	cmp byte [rdi], al      ; if c == str2[j]
	je end_while
	cmp al, 0               ; if str2[j] == '\0'
	je end_inside_while
	inc r8                  ; i++
	jmp inside_while

end_inside_while:
	inc rdi                 ; j++
	jmp while

return_null:
	mov rax, 0              ; set return value to NULL
	leave
	ret

end_while:
    mov rax, rdi            ; set return value
	leave
	ret