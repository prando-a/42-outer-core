section .text
global ft_strcmp

.loop:
    movzx   eax, byte [rdi]    ; eax = (unsigned char)*s1
    movzx   edx, byte [rsi]    ; edx = (unsigned char)*s2
    cmp     eax, edx
    jne     .dif              ; si son distintos → salir con la resta

    test    eax, eax           ; ¿*s1 == *s2 == '\0'?
    je      .eq             ; sí → cadenas iguales → return 0

    inc     rdi
    inc     rsi
    jmp     .loop

.dif:
    sub     eax, edx           ; eax = eax - edx
    ret

.eq:
    xor     eax, eax           ; return 0
    ret