NAME		=	libasm.a

AS			=	nasm
ASMFLAGS	=	-f elf64 -w+all -w+error

AR			=	ar
ARFLAGS		=	rc

RM			=	rm -f

MAKE		=	make -s

SRC			=	ft_strlen.s \
				ft_strcpy.s \
				ft_strcmp.s \
				ft_strdup.s \
				ft_write.s \
				ft_read.s \
				ft_isspace.s \
				ft_strchr.s \
				ft_atoi_base.s \
				ft_list_size.s \
				ft_list_push_front.s \
				ft_list_remove_if.s \
				ft_list_sort.s

OBJ			=	$(SRC:%.s=$(OBJ_DIR)/%.o)
OBJ_DIR		=	obj

all: $(NAME)

$(NAME): $(OBJ)
		@$(AR) $(ARFLAGS) $(NAME) $(OBJ)
		@ranlib $(NAME)
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

test:
		@git clone --recurse-submodules https://github.com/Yuerino/libasm-unit-test.git test

run-test: | test
		@$(MAKE) -C test run

test-old: all
		@$(MAKE) -C test-old run

.PHONY: all clean fclean re test-old run-test
