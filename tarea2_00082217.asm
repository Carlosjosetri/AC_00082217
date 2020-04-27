        org     100h
        ;ej1
	;00082217 suma =20 promedio 4 
section .text
	mov di,0d
	mov cx,[len]
lup: 	mov bl,[mensaje+di]
	mov [di+200h],bl
	inc di
	loop lup
	
        ;ej2

        mov     ax, 0000h
        mov     al, 2d
        mov     bx, 210h
        mov     cx, 2d
mult:   mul     cx
        mov     [bx], ax
        cmp     ah, 00h
        ja      lupi
    lupi:  add     bx, 2h
        jmp     sig
sig:    cmp     bx, 21Fh
        jb      mult


;ej3

        mov     cx, 0000h
        mov     cx, 0h
        mov     [220h], cx
        mov     cx, 1h
        mov     [221h],cx 
        mov     bx, 221h

lupi:   add     bx, 1h     
        mov     dx, 0000h
        mov     [bx], dx
        add     [bx], ax
        add     [bx], cx
        mov     ax, cx
        mov     cx, [bx]
        cmp     bx, 22Eh
        jne     lupi


        int 20h
section .data
        mensaje db "me recupero"
        len equ $-mensaje