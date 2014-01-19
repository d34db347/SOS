	org	07c00h
	mov	ax, cs
	mov	ds, ax
	mov	es, ax
	call	ShowStr
	jmp	$					;无限循环, 后面会用 hlt 来代替
ShowStr:
	mov	ax, BootMessage
	mov	bp, ax
	mov	cx, 12				;字符串长度
	mov	ax, 01301h
	mov	bx, 000ch			;bh = 0 页号, bl ＝ 0ch, 黑底红字
	mov	dl, 0
	int	10h
	ret
BootMessage:
	db	"Hello World!"
times	510-($-$$) db	0	;填充剩余空间使得生成文件为 512 字节
	dw	0xaa55