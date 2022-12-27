; -----------------------------------------------------------------------------
; The ft_list_push_front() function adds a new element of type t_list with data
; from given paramter to the beginning of the list pointed to by the parameter
; begin_list.
; If necessary, it’ll update the pointer at the beginning of the list.
;
;   void ft_list_push_front(t_list **begin_list, void *data);
;
; t_list is defined as follows:
;
;   typedef struct  s_list
;   {
;       void          *data;
;       struct s_list *next;
;   }   t_list;
; -----------------------------------------------------------------------------

            global ft_list_push_front
            extern malloc

            section .text
ft_list_push_front:                     ; rax ft_list_push_front(rdi, rsi)
            test    rdi, rdi            ; check if begin_list is NULL
            jz      .Lreturn            ; if zero, return
            push    rdi                 ; save rdi
            push    rsi                 ; save rsi
            sub     rsp, 8              ; align stack
            mov     rdi, 16             ; rdi = 16
            call    malloc wrt ..plt    ; rax = malloc(rdi)
            add     rsp, 8              ; restore stack
            pop     rsi                 ; restore rsi
            pop     rdi                 ; restore rdi
            test    rax, rax            ; check if malloc failed
            jz      .Lreturn            ; if zero, return
            mov     rcx, [rdi]          ; rcx = *begin_list
            mov     [rax], rsi          ; rax->data = rsi
            mov     [rax + 8], rcx      ; rax->next = rcx
            mov     [rdi], rax          ; *begin_list = rax
.Lreturn:
            ret

