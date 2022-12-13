; -----------------------------------------------------------------------------
; The ft_strdup() function allocates sufficient memory for a copy of the string
; s1, does the copy, and returns a pointer to it. The pointer may subsequently
; be used as an argument to the function free(3).
;
; If insufficient memory is available, NULL is returned and errno is set to
; ENOMEM.
;
;   char *ft_strdup(const char *s1);
; -----------------------------------------------------------------------------

            global ft_strdup
            extern malloc
            extern ft_strlen
            extern ft_strcpy

            section .text
ft_strdup:                                  ; rax ft_strdup(rdi)
            push    rdi                     ; save rdi (s1)
            call    ft_strlen               ; rax = ft_strlen(rdi)
            lea     rdi, [rax + 1]          ; rdi = rax+1 for null byte
            call    malloc wrt ..plt        ; rax = malloc(rdi)
            test    rax, rax                ; check if malloc failed
            jz      .Lmalloc_failed         ; if zero, jump to .Lmalloc_failed
            pop     rsi                     ; restore rdi to (s1)
            mov     rdi, rax                ; move rax to rdi
            jmp     ft_strcpy               ; jump ft_strcpy(rdi, rsi)
.Lmalloc_failed:
            xor     eax, eax
            ret
