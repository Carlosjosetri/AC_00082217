org 	100h

section .text

	call 	texto	
	call 	cursor
	call 	phrase

	call	kbwait

	int 	20h

texto:	mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

cursor: mov	ah, 01h
	mov 	ch, 00000000b
	mov 	cl, 00001110b
		;   IRGB
	int 	10h
	ret

kbwait: mov 	ax, 0000h
	int 	16h
	ret

w_char:	mov 	ah, 09h
	mov 	al, cl
	mov 	bh, 0h
	mov 	bl, 00001111b
	mov 	cx, 1h
	int 	10h
	ret

m_cursr:mov 	ah, 02h
	mov 	dx, di  ; columna
	mov 	dh, 3d ; fila
	mov 	bh, 0h
	int 	10h
	ret

phrase:	mov 	di, 3d
loop:	mov 	cl, [fra+di-3d]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len
	jb	loop
	ret


section .data
fra	db 	"Experimento de la doble rendija"
len 	equ	$-fra+3d
