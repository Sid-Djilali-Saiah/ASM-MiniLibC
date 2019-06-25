bits 64

    section .text
    global rindex:

rindex:
    push rbp
    mov rbp, rsp

    xor rax, rax            ; set return value
    xor rcx, rcx            ; i = 0

go_to_end:
	cmp byte [rdi + rcx], 0 ; if str[i] == '\0'
	je while
	inc rcx                 ; i++;
	jmp go_to_end

while:
	cmp [rdi + rcx], sil    ; str[i] == c
	je end_while
	cmp rcx, 0              ; if i = 0 no match found
	je return_null
	dec rcx                 ; i--
	jmp while

return_null:
	mov rax, 0
	leave
	ret

end_while:
	add rdi, rcx            ; str = str + i
	mov rax, rdi            ; set return value
	leave
	ret