; -----------------------------------------------------------------------------
; The ft_list_size() function returns the number of element in the list.
;
;   int ft_list_size(t_list *begin_list)
;
; t_list is defined as follows:
;
;   typedef struct  s_list
;   {
;       struct s_list *next;
;       void          *data;
;   }   t_list;
; -----------------------------------------------------------------------------

            global ft_list_size

            section .text
ft_list_size:                       ; eax ft_list_size(rdi)
            xor     eax, eax        ; zero-ed rax
.Lloop:
            test    rdi, rdi        ; test if rdi is 0
            je      .Lend           ; if zero, jump to .Lend
            add     rax, 1          ; rax++
            mov     rdi, [rdi + 8]  ; rdi = rdi->next
            jmp     .Lloop          ; jump to .Lloop
.Lend:
            ret
