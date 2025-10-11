section	.text
global	ft_read
extern	__errno_location

ft_read:
	mov		rax, 0
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