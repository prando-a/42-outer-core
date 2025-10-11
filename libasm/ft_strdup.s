section .text
extern malloc
extern ft_strlen
extern ft_strcpy
global ft_strdup

; char *ft_strdup(const char *s);
ft_strdup:
    push    rdi
    call ft_strlen 
    inc rax


    mov rdi, rax ; size for malloc
    call malloc wrt ..plt 

    cmp rax, 0
    je .end

    mov  rdi, rax
    mov  rsi, [rsp]
    call ft_strcpy


.end:
    add rsp, 8
    ret

