section .text
global ft_strcpy

ft_strcpy:
    mov rax, rdi                ; dst (rdi) copiado a rax
    mov rdi, -1                 ; ahora asignamos a rdi -1 para tenerlo de contador
    xor cl, cl                  ; asignamos 0 a cl para guardar el caracter a copiar


.loop:
    inc rdi                     ; incremento de rdi, primera iteración valdrá 0
    mov cl, BYTE [rsi + rdi]    ; copiamos el byte de src (rsi), posición sumada por el contador rdi a cl
    mov BYTE [rax + rdi], cl    ; copiamos el caracter de cl a la posición rdi de dst (rax)
    cmp cl, 0                   ; actualizamos las RFLAGS comparando el caracter copiado con el valor 0 ('\0')
    jne .loop                   ; jne lee una de las RFLAG, ZF ("Zero Flag") y realiza la instrucción si ésta es 0. la instrucción es volver al bucle 


ret                             ; ret sale de la función y devuelve automáticamente rax (dst), (man strcpy)