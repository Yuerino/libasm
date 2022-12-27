; -----------------------------------------------------------------------------
; The ft_list_remove_if() function removes from the list, all elements whose
; data compared to data_ref using cmp, makes cmp return 0.
; The data from an element to be erased should be freed using free_fct.
; If necessary, it’ll update the pointer at the beginning of the list.
;
;   void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(),
;                           void (*free_fct)(void *));
;
; t_list is defined as follows:
;
;   typedef struct  s_list
;   {
;       void          *data;
;       struct s_list *next;
;   }   t_list;
; -----------------------------------------------------------------------------

            global ft_list_remove_if
            extern free

            section .text
ft_list_remove_if:                  ; rax ft_list_remove_if(rdi, rsi, rdx, rcx)
            test    rdi, rdi        ; if (begin_list == NULL)
            jz      .Lret           ; return;
            push    rbx             ; save rbx
            push    r12             ; save r12
            push    r13             ; save r13
            push    r14             ; save r14
            push    r15             ; save r15
            sub     rsp, 16         ; allocate for 1 ptr and align stack
            mov     [rsp + 8], rdi  ; save begin_list
            mov     rbx, rsi        ; rbx = data_ref
            mov     r12, [rdi]      ; r12 = *begin_list
            xor     r13d, r13d      ; r13 = 0
            mov     r14, rdx        ; r14 = rdx
            mov     r15, rcx        ; r15 = rcx
.Lloop:
            test    r12, r12        ; if (list == NULL)
            jz      .Lret           ; return
            mov     rdi, [r12]      ; rdi = r12->data
            mov     rsi, rbx        ; rsi = data_ref
            xor     eax, eax        ; clear rax
            call    r14             ; cmp(rdi, rsi)
            test    eax, eax        ; if (cmp(r12->data, data_ref) == 0)
            jz      .Lequal         ; if zero, goto .Lequal
            mov     r13, r12        ; r13 = r12
            mov     r12, [r12 + 8]  ; r12 = r12->next
            jmp     .Lloop          ; loop

.Lequal:
            mov     rdi, [r12]      ; rdi = r12->data
            call    r15             ; free_fct(rdi)
            mov     rcx, r12        ; rcx = r12
            mov     r12, [r12 + 8]  ; r12 = r12->next
            test    r13, r13        ; if (r13 == 0)
            jz      .Lfirst         ; goto .Lfirst
            mov     [r13 + 8], r12  ; r13->next = r12
            mov     rdi, rcx        ; rdi = rcx
            call    free wrt ..plt  ; free(rdi)
            jmp     .Lloop          ; loop

.Lfirst:
            mov     rdi, [rsp + 8]  ; rdi = begin_list
            mov     [rdi], r12      ; *begin_list = rdx
            mov     rdi, rcx        ; rdi = rcx
            call    free wrt ..plt  ; free(rdi)
            jmp     .Lloop          ; loop

.Lret:
            add     rsp, 16         ; deallocate
            pop     r15             ; restore r15
            pop     r14             ; restore r14
            pop     r13             ; restore r13
            pop     r12             ; restore r12
            pop     rbx             ; restore rbx
            ret
