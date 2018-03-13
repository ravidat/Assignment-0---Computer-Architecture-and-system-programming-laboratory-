section .data                    	; data section, read-write
        an:    DQ 0              	; this is a temporary var

section .text                    	; our code is always in the .text section
        global do_Str          	    ; makes the function appear in global scope
        extern printf            	; tell linker that printf is defined elsewhere 							; (not used in the program)

do_Str:                        	    ; functions are defined as labels
        push    rbp              	; save Base Pointer (bp) original value
        mov     rbp, rsp         	; use base pointer to access stack contents
        mov rcx, rdi			    ; get function argument

;;;;;;;;;;;;;;;; FUNCTION EFFECTIVE CODE STARTS HERE ;;;;;;;;;;;;;;;; 

	mov	qword [an], 0		; initialize answer
	label_here:

   		; Your code goes somewhere around here...
                cmp byte [rcx], '('
   		jnz isnt_left 
   		mov byte [rcx], '<'
   		jmp isnt_char
   		isnt_left:
   		cmp byte [rcx], ')'
   		jnz isnt_right
   		mov byte [rcx], '>'
   		jmp isnt_char
   		isnt_right:
   		cmp byte [rcx], 'A'
   		jl isnt_char
   		cmp byte [rcx], 'Z'
   		jnge is_char
   		cmp byte [rcx], 'a'
   		jl isnt_char
   		cmp byte [rcx], 'z'
   		jg isnt_char
   		sub byte [rcx], 32
   		jmp is_char
   		isnt_char:
   		inc byte [an] ; increment counter
   		is_char:
		inc rcx      	    ; increment pointer
		cmp byte [rcx], 0   ; check if byte pointed to is zero
		jnz label_here      ; keep looping until it is null terminated


;;;;;;;;;;;;;;;; FUNCTION EFFECTIVE CODE ENDS HERE ;;;;;;;;;;;;;;;; 

         mov     rax,[an]         ; return an (returned values are in rax)
         mov     rsp, rbp
         pop     rbp
         ret 
		 