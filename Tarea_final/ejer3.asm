org 	100h

section .text

	call 	grafico	; 
	xor 	di, di 
    xor     si, si
            
    mov [300h], byte 0100b
    mov si, 10d 
    mov di, 70d 
    jmp raton;
    

cubo: mov cx, si
    mov dx, di 
    call pixel 
    inc si   
    cmp si, 85d 
    jne cubo 
    xor si, si 
    mov si, 10d 
    mov cx, si 
    inc di   
    cmp di, 145d
    jne cubo
    ret


raton: MOV AX, 0
    INT 33h
    MOV AX, 1

    INT 33h
    mov ax, 04h
    mov cx, 300
    mov dx, 200
    int 33h
    call cubo
    mov ax, 06h
    int 33h 
       
lupin:  mov ax,03h
        int 33h
        and bx, 3h
        CMP CX, 10d  
        JGE lupin1
    lupin1:  CMP CX, 85d 
        JLE lupin2
        jmp lupin 
    lupin2: cmp dx, 70d 
        JGE lupin3
    lupin3: cmp dx, 145d
        JLE lupin4
        jmp lupin
    lupin4: cmp bx, 00000001b
        JE cambio
        JL lupin5
    lupin5: cmp bx, 00000010b
        JE terminar
        jmp lupin


cambio:cmp [300h], byte 0100b
        JE color2
        cmp [300h], byte 0010b
        JE color3
        cmp  [300h], byte 0001b 
        JE reset

color2: mov  [300h], byte  0010b
        mov si, 10d 
        mov di, 70d 
        jmp raton

color3:mov [300h], byte 0001b 
        mov si, 10d
        mov di, 70d 
        jmp raton

reset:  mov [300h], byte 0100b
        mov si, 10d 
        mov di, 70d 
        jmp raton

grafico:mov ah,00h
        mov al, 12h
        int 10h
        ret

pixel:  mov ah, 0Ch
        mov al, [300h]
        int 10h
        ret
kb: 	mov	ah, 00h
	    int 	16h
	    ret

terminar:mov ah, 00h
        int 10h
        mov ah,0x4C         
        int 0x21
