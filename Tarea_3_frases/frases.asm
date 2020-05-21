org 	100h

section .text

	call 	texto	
	call 	cursor
	

	call 	phrase
	call 	phrase2
	call 	phrase3
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

phrase:	mov 	di, 25d  ;contador la celda de donde sacamos chars
loop:	mov 	cl, [fra+di-25d]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len
	jb	loop
	ret
w_chart2:	mov 	ah, 09h
	mov 	al, cl
	mov 	bh, 0h
	mov 	bl, 00001111b
	mov 	cx, 1h
	int 	10h
	ret

m_cursr2:mov 	ah, 02h
	mov 	dx, di  ; columna
	mov 	dh, 9d ; fila
	mov 	bh, 0h
	int 	10h
	ret

phrase2:	mov 	di, 25d
lupin:	mov 	cl, [fra2+di-25d]
	call    m_cursr2
	call 	w_chart2
	inc	di
	cmp 	di, len2
	jb	lupin
	ret

w_char3:	mov 	ah, 09h
	mov 	al, cl
	mov 	bh, 0h
	mov 	bl, 00001111b
	mov 	cx, 1h
	int 	10h
	ret

m_cursr3:mov 	ah, 02h
	mov 	dx, di  
	mov 	dh, 15d 
	mov 	bh, 0h
	int 	10h
	ret

phrase3:	mov 	di, 25d
lupin3:	mov 	cl, [fra3+di-25d]
	call    m_cursr3
	call 	w_char3
	inc	di
	cmp 	di, len3
	jb	lupin3
	ret



section .data
fra	db 	"Experimento de la doble rendija"
len 	equ	$-fra+25d
fra2	db 	"Gato de schrodinger"
len2 	equ	$-fra2+25d
fra3	db 	"Funcion de Onda"
len3 	equ	$-fra3+25d
