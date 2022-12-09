NAME	=	test.out

CC		=	gcc
CFLAGS	=	$(IFLAGS) -Wall -Wextra -Werror
IFLAGS	=	-I.
LDLIBS	=	-L.. -lasm

RM		=	rm -f

SRC		=	main.c

OBJ		=	$(SRC:.c=.o)

all: $(NAME)

$(NAME): $(OBJ)
		@$(CC) $(CFLAGS) -o $@ $^ $(LDLIBS)
		@echo "\033[32mBuild $(NAME) succesfully!\033[0m"

%.o: %.c
		@echo "\033[33mCompiling $<\033[0m"
		@$(CC) $(CFLAGS) -c -o $@ $<

clean:
		@$(RM) $(OBJ)
		@$(RM) -r $(NAME).dSYM
		@echo "\033[32mCleaned all test object and debug files\033[0m"

fclean: clean
		@$(RM) $(NAME)
		@echo "\033[32mCleaned all test binary files\033[0m"

re: fclean all

run: re
		./$(NAME)

.PHONY: all clean fclean re run
