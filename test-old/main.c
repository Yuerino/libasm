#include "test.h"

int main() {
    const char *str = "Hello World";
    printf("Length of %s is %ld\n\n", str, ft_strlen(str));
    char dest[100];
    printf("Copied string is %s\n\n", ft_strcpy(dest, str));
    printf("hello vs hell0: ft: %i, org: %i\n\n",
        ft_strcmp("hello", "hell0"), strcmp("hello", "hell0"));
    char *dest2 = ft_strdup(str);
    printf("Duplicated string is %s\n\n", dest2);
    ft_write(1, "Hello World\n", 12);
    int fd = open("main.c", O_RDONLY);
    if (fd < -1) {
        printf("Error opening file\n");
        return 1;
    }
    char buf[4242];
    size_t readSize = ft_read(fd, buf, 4241);
    close(fd);
    buf[readSize] = '\0';
    printf("Read from file: %s\n", buf);
    printf("Is space: %i\n", ft_isspace(' '));
    printf("at index: %s\n", ft_strchr(str, 'H'));
    printf("20 in base 16: %i\n", ft_atoi_base("+20", "0123456789ABCDEF"));

    {
    t_list *list = malloc(sizeof(t_list));
    list->data = ft_strdup("Hello");
    list->next = malloc(sizeof(t_list));
    list->next->data = ft_strdup("World");
    list->next->next = NULL;
    printf("List size: %i\n", ft_list_size(list));
    ft_list_push_front(&list, ft_strdup("New"));
    printf("List size: %i\n", ft_list_size(list));
    printf("First element: %s\n", (char *)list->data);
    //leaks
    }

    {
    t_list *tmp = NULL;
    ft_list_push_front(&tmp, ft_strdup("Tmp1"));
    printf("List size: %i\n", ft_list_size(tmp));
    printf("First element: %s\n", (char *)tmp->data);
    //leaks
    }

    {
    t_list *list = malloc(sizeof(t_list));
    list->data = ft_strdup("tmp1");
    list->next = malloc(sizeof(t_list));
    list->next->data = ft_strdup("tmp2");
    list->next->next = 0;
    ft_list_remove_if(&list, "tmp1", strcmp, free);
    printf("\n\nstr: %s\n", (char *)list->data);
    printf("ptr: %p\n", list->next);
    //leaks
    }

    {
    t_list *list = malloc(sizeof(t_list));
    list->data = ft_strdup("tmp2");
    list->next = malloc(sizeof(t_list));
    list->next->data = ft_strdup("tmp1");
    list->next->next = 0;
    ft_list_sort(&list, strcmp);
    printf("\n\nstr: %s\n", (char *)list->data);
    printf("ptr: %p\n", list->next);
    //leaks
    }
    return 0;
}
