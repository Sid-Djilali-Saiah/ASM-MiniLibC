bits 64
	section .text
	global memset:

memset:
    push rbp
    mov rbp, rsp
	xor	rcx, rcx                ; i = 0

while:
	cmp	rdx, rcx                ; i != n
	je	end_while
	mov	byte [rdi + rcx], sil   ; str[i] = c
	inc	rcx                     ; i++
	jmp	while

end_while:
	mov	rax, rdi                ; set return value
	leave
	ret
