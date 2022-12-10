#ifndef TEST_H
#define TEST_H

#include <stdio.h>
#include <string.h>
#include <fcntl.h>

size_t  ft_strlen(const char *str);
char    *ft_strcpy(char *dest, const char *src);
int     ft_strcmp(const char *s1, const char *s2);
char    *ft_strdup(const char *s1);
ssize_t ft_write(int fildes, const void *buf, size_t nbyte);
ssize_t ft_read(int fildes, void *buf, size_t nbyte);

#endif
