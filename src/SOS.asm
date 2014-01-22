	org	07c00h				;程序装载地址
	jmp	entry
	db	090h
	db	"SOSIPL"			;启动区名称
	dw	512					;每个扇区大小512字节
	db	1					;簇大小1个扇区
	dw	1					;FAT起始位置第一个扇区
	db	2					;FAT个数2
	dw	224					;根目录大小224项	
	dw	2880				;磁盘大小2880扇区 1.44MB
	db	0f0h				;磁盘种类0xf0
	dw	9					;FAT长度9扇区
	dw	18					;1个磁道18个扇区
	dw	2					;磁头数2
	dd	0					;不使用分区
	dd	2880				;重写一次磁盘大小
	db	0, 0, 029h			;
	dd	0ffffffffh			;卷标号码
	db	"SOS"				;磁盘名称
	db	"FAT12"				;磁盘格式名称
	times 18 db 0			;预留18个字节

entry:
	mov	ax, 0				;初始化寄存器
	mov	ss, ax
	mov	sp, 07c00h
	mov	ds, ax
	mov	es, ax
	mov	si, msg

putloop:
	mov	al, [si]
	add	si, 1
	cmp	al, 0
	je	fin
	mov	ah, 0eh				;显示文字
	mov	bx, 15				;字符颜色
	int	10h					;调用显卡BIOS
	jmp	putloop

fin:
	hlt						;CPU停止
	jmp	fin					;无限循环

msg:
	db	0a0ah				;换行两次
	db	"Hello World!"
	db	0ah					;换行
	db	0

times	7dfeh-($-$$) db	0	;填充剩余空间使得生成文件为 512 字节
	dw	0xaa55