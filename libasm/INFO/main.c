#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>

// Declaraciones de las funciones de libasm
size_t  ft_strlen(const char *str);
char    *ft_strcpy(char *dst, const char *src);
int     ft_strcmp(const char *s1, const char *s2);
ssize_t ft_write(int fd, const void *buf, size_t count);
ssize_t ft_read(int fd, void *buf, size_t count);
char    *ft_strdup(const char *s);

int main(int argc, char **argv)
{
    if (argc != 2)
    {
        fprintf(stderr, "Uso: %s <cadena>\n", argv[0]);
        return 1;
    }

    //const char *input_str = argv[1];

    // Prueba de ft_strlen
    //printf("ft_strlen(\"%s\") = %zu\n", input_str, ft_strlen(input_str));

    // Prueba de ft_strcpy
    //char dest[50];
    //printf("ft_strcpy(dest, \"Libasm\") = %s\n", ft_strcpy(dest, argv[1]));

    //int ret = ft_write(1, argv[1], ft_strlen(argv[1]));

    //ft_write(1, "\n", 1);

    char *str = ft_strdup(argv[1]);

    printf("%s\n", str);

    printf("ft_strcmp(\"abc\", \"abc\") = %d\n", ft_strcmp("abc", "abc"));
    printf("ft_strcmp(\"abc\", \"abd\") = %d\n", ft_strcmp("abc", "abd"));
    printf("ft_strcmp(\"abd\", \"abc\") = %d\n", ft_strcmp("abd", "abc"));

    return 0;
}



/*int main(void)
{
    // Prueba de ft_strlen
    printf("ft_strlen(\"Hello, World!\") = %zu\n", ft_strlen("Hello, World!"));

    // Prueba de ft_strcpy
    char dest[50];
    printf("ft_strcpy(dest, \"Libasm\") = %s\n", ft_strcpy(dest, "Libasm"));

    // Prueba de ft_strcmp
    printf("ft_strcmp(\"abc\", \"abc\") = %d\n", ft_strcmp("abc", "abc"));
    printf("ft_strcmp(\"abc\", \"abd\") = %d\n", ft_strcmp("abc", "abd"));
    printf("ft_strcmp(\"abd\", \"abc\") = %d\n", ft_strcmp("abd", "abc"));

    // Prueba de ft_write
    printf("ft_write(1, \"Hello, World!\\n\", 14) = %zd\n", ft_write(1, "Hello, World!\n", 14));

    // Prueba de ft_read
    char buffer[50];
    printf("Escribe algo: ");
    ssize_t bytes_read = ft_read(0, buffer, 49);
    if (bytes_read >= 0)
    {
        buffer[bytes_read] = '\0';
        printf("Leído: %s\n", buffer);
    }
    else
    {
        perror("ft_read");
    }

    // Prueba de ft_strdup
    char *dup = ft_strdup("Libasm es genial!");
    if (dup)
    {
        printf("ft_strdup(\"Libasm es genial!\") = %s\n", dup);
        free(dup);
    }

    return 0;
}*/