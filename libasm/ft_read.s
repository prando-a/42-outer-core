section .text
global ft_read

ft_read:
    mov rax, 0
    syscall
    mov rax, rdi
    ret
