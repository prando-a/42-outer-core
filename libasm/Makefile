# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: prando-a <prando-a@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/27 13:24:37 by prando-a          #+#    #+#              #
#    Updated: 2025/10/08 19:55:55 by prando-a         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

SRC = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
BONUS = ft_atoi_base.s

OBJ = $(SRC:.s=.o)
BONUS_OBJ = $(BONUS:.s=.o)

NASM_FLAGS = -f elf64


all: $(NAME)

$(NAME): $(OBJ)
	ar rcs $(NAME) $(OBJ)

bonus: $(OBJ) $(BONUS_OBJ)
	ar rcs $(NAME) $(OBJ) $(BONUS_OBJ)

# Commented during evaluation
MAIN = ./INFO/main.c
test: all
	gcc -Wall -Wextra -Werror $(MAIN) -L. -lasm -o test

%.o: %.s
	nasm $(NASM_FLAGS) $< -o $@

clean:
	rm -f $(OBJ) $(BONUS_OBJ)

fclean: clean
	rm -f $(NAME)
	rm -f test

re: fclean all

.PHONY: all clean fclean re bonus