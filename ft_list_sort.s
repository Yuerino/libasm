; -----------------------------------------------------------------------------
; The ft_list_remove_if() function sorts the list's elements by asecnding order
; by comparing their data using the cmp() function.
; If necessary, it’ll update the pointer at the beginning of the list.
;
;   void ft_list_sort(t_list **begin_list, int (*cmp)());
;
; t_list is defined as follows:
;
;   typedef struct  s_list
;   {
;       void          *data;
;       struct s_list *next;
;   }   t_list;
; -----------------------------------------------------------------------------

            global ft_list_sort

            section .text
ft_list_sort:                   ; rax ft_list_sort(rdi, rsi)
            test    rdi, rdi    ; if (begin_list == NULL)
            je      .Lret       ; return
            push    rbx         ; save rbx
            push    r12         ; save r12
            push    r13         ; save r13
            push    r14         ; save r14
            push    r15         ; save r15
            mov     r12, rdi    ; r12 = begin_list
            mov     r13, rsi    ; r13 = cmp
            mov     r14, [rdi]  ; r14 = *begin_list
            xor     r15d, r15d  ; r15 = 0
.Lloop:
            mov     rbx, [r14 + 8]  ; rbx = r14->next
            test    rbx, rbx        ; if (r14->next == NULL)
            jz      .Lret           ; if zero, return
            mov     rdi, [r14]      ; rdi = r14->data
            mov     rsi, [rbx]      ; rsi = r14->next->data
            xor     eax, eax        ; eax = 0
            call    r13             ; cmp(r14->data, r14->next->data)
            test    eax, eax        ; if (cmp(r14->data, r14->next->data) > 0)
            jg      .Lswap          ; if greater, jump to swap
            mov     r15, r14        ; r15 = r14
            mov     r14, rbx        ; r14 = r14->next
            jmp     .Lloop          ; loop

.Lswap:
            mov     rax, [rbx + 8]  ; rax = r14->next->next
            mov     [r14 + 8], rax  ; r14->next = r14->next->next
            mov     [rbx + 8], r14  ; r14->next->next = r14
            test    r15, r15        ; if (r15 == NULL)
            jz      .Lfirst         ; if zero, jump .Lfirst
            mov     [r15 + 8], rbx  ; r15->next = r14->next
            mov     r14, [r12]      ; r14 = *begin_list
            xor     r15d, r15d      ; r15 = 0
            jmp     .Lloop          ; loop

.Lfirst:
            xor     r15, r15        ; rax = 0
            mov     [r12], rbx      ; *begin_list = r14->next
            mov     r14, [r12]      ; r14 = *begin_list
            jmp     .Lloop          ; loop

.Lret:
            pop     rbx         ; restore rbx
            pop     r15         ; restore r15
            pop     r14         ; restore r14
            pop     r13         ; restore r13
            pop     r12         ; restore r12
            ret

