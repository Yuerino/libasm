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
    return 0;
}
