	org	0d800h		;程序装载的位置
	mov	al, 13h		;320x200x8 VGA
	mov	ah, 0
	int	10h
fin:
	hlt
	jmp	fin
