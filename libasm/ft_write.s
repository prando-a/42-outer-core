section	.text
global	ft_write
extern	__errno_location

ft_write:
	mov		rax, 1
	syscall

	test	rax, rax
	jns		.end

	mov		rdi, rax
	neg		edi
	call	__errno_location wrt ..plt

	mov		DWORD [rax], edi

	mov		rax, -1
	ret

.end:
	ret