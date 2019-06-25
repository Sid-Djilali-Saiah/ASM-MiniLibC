ASM		=   nasm

ASMFLAGS	=   -f elf64

LD		=   ld

LDFLAGS		= -fPIC -shared

RM		=   rm -f

NAME	=   libasm.so

SRCS	= ./src/strlen.asm		\
		  ./src/strcmp.asm		\
		  ./src/strncmp.asm		\
		  ./src/strchr.asm		\
		  ./src/memset.asm		\
		  ./src/memcpy.asm		\
		  ./src/rindex.asm		\
		  ./src/strcspn.asm		\
		  ./src/strpbrk.asm		\
		  ./src/strcasecmp.asm		\
		  ./src/strstr.asm		\
		  ./src/memmove.asm

OBJS		= $(SRCS:.asm=.o)


all: $(NAME)

$(NAME): $(OBJS)
	 $(LD) $(LDFLAGS) -o $(NAME) $(OBJS)

%.o: %.asm
	$(ASM) $(ASMFLAGS) $< -o $@

clean:
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(NAME)

re:	fclean all

.PHONY: all clean fclean re