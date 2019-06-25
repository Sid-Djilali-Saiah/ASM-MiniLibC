bits 64

    section .text
    global strcmp:

strcmp:
	push rbp
	mov rbp, rsp

	xor rcx, rcx            ; i = 0

while:
	mov r8b, [rdi + rcx]    ; char a = str1[i]
	mov r9b, [rsi + rcx]    ; char b = str1[i]
	cmp r8b, 0
	je end_while            ; if a == '\0'
	cmp r9b, 0
	je end_while            ; if b == '\0'
	cmp r8b, r9b
	jne end_while           ; if a != b
	inc rcx                 ; i++
	jmp while

end_while:
	sub r8b, r9b            ; a = a - b
	movsx rax, r8b          ; set a to return value with resize
    leave
	ret
