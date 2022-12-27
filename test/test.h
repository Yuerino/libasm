#ifndef TEST_H
#define TEST_H

#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>

typedef struct s_list
{
    void *data;
    struct s_list *next;
}   t_list;

size_t  ft_strlen(const char *str);
char    *ft_strcpy(char *dest, const char *src);
int     ft_strcmp(const char *s1, const char *s2);
char    *ft_strdup(const char *s1);
ssize_t ft_write(int fildes, const void *buf, size_t nbyte);
ssize_t ft_read(int fildes, void *buf, size_t nbyte);
int     ft_isspace(int c);
char    *ft_strchr(const char *s, int c);
int     ft_atoi_base(const char *str, const char *base);
int     ft_list_size(t_list *begin_list);
void    ft_list_push_front(t_list **begin_list, void *data);

#endif
