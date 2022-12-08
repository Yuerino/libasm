#include "test.h"

int main() {
    const char *str = "Hello World";
    printf("Length of %s is %ld\n", str, ft_strlen(str));
    char dest[100];
    printf("Copied string is %s\n", ft_strcpy(dest, str));
    return 0;
}
