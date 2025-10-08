section .text
extern malloc
extern ft_strlen
extern ft_strcpy
global ft_strdup

ft_strdup:
    call ft_strlen
    inc rax

    mov rsi, rdi
    mov rdi, rax
    call malloc
    cmp rax, 0
    je .error

    mov rdi, rax
    call ft_strcpy
    ret



.error
    ret

