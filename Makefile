NAME		=	libasm.a

AS			=	nasm
ASMFLAGS	=	-f elf64 -w+all -w+error

AR			=	ar
ARFLAGS		=	rcs

RM			=	rm -f

MAKE		=	make -s

SRC			=	ft_strlen.s \
				ft_strcpy.s \
				ft_strcmp.s \
				ft_strdup.s

OBJ			=	$(SRC:%.s=$(OBJ_DIR)/%.o)
OBJ_DIR		=	obj

all: $(NAME)

$(NAME): $(OBJ)
		@$(AR) $(ARFLAGS) $(NAME) $(OBJ)
		@echo "\033[32mBuild $(NAME) succesfully!\033[0m"

$(OBJ_DIR)/%.o: %.s
		@echo "\033[33mCompiling $<\033[0m"
		@mkdir -p $(@D)
		@$(AS) $(ASMFLAGS) -o $@ $<

clean:
		@$(RM) -r $(OBJ_DIR)
		@$(MAKE) -C test clean
		@echo "\033[32mCleaned all object files\033[0m"

fclean: clean
		@$(RM) $(NAME)
		@$(MAKE) -C test fclean
		@echo "\033[32mCleaned all binary files\033[0m"

re: fclean all

test: all
		@$(MAKE) -C test run

.PHONY: all clean fclean re test
