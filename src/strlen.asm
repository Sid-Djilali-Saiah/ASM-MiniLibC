bits 64

	section .text
    global strlen:

strlen:
    push rbp
    mov rbp, rsp

	xor rax, rax        ;init return value (i = 0)

while:
	cmp BYTE [rdi], 0   ;check if (str == 0)
	je end_while        ;conditional jump if below cmp == true
	inc rdi             ;increment pointer (str++)
	inc rax             ;increment return value (i++)
	jmp while           ;loop

end_while:
    leave
	ret