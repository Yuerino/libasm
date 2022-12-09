; -----------------------------------------------------------------------------
; The ft_strcmp() function compares the two strings s1 and s2.
;
;   int ft_strcmp(const char *s1, const char *s2);
;
; The ft_strcmp() function returns an integer less than, equal
; to, or greater than zero if s1 (or the first n bytes thereof) is found,
; respectively, to be less than, to match, or be greater than s2.
; -----------------------------------------------------------------------------

            global ft_strcmp

            section .text
ft_strcmp:                                  ; eax ft_strcmp(rdi, rsi)
            xor     ecx, ecx                ; set index to 0
.Lloop:
            movzx   eax, byte [rdi + rcx]   ; load current char from s1
            movzx   edx, byte [rsi + rcx]   ; load current char from s2
            cmp     al, dl                  ; compare current chars
            jne     .Lend                   ; if not equal, break
            add     rcx, 1                  ; index++
            test    al, al                  ; test if current char of s1 is 0
            jnz     .Lloop                  ; if not zero, loop
.Lend:
            sub     eax, edx                ; subtract current char of s2 from s1
            ret
