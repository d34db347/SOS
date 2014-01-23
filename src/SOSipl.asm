	org	07c00h				;程序装载地址
	jmp	short entry
	nop
	;db	090h
	db	"SOSIPLXX"			;启动区名称,8字节
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
	db	"SmallOS0001"		;磁盘名称,11字节
	db	"FAT12   "			;磁盘格式名称,8字节
	;times 18 db 0			;预留18个字节

entry:
	mov	ax, 0				;初始化寄存器
	mov	ss, ax
	mov	sp, 07c00h
	mov	ds, ax
;读盘
	mov	ax, 0820h
	mov	es, ax
	mov	ch, 0				;柱面0
	mov	dh, 0				;磁头0
	mov	cl, 2				;扇区2

readloop:
	mov	si, 0				;记录读盘失败次数

retry:
	mov	ah, 02h				;ah=02h 读盘
	mov	al, 1				;1个扇区
	mov	bx, 0
	mov	dl, 0				;A盘
	int	13h					;调用磁盘BIOS
	jnc	next
	add	si, 1				;出错计数
	cmp	si, 5				;比较错误次数
	jae	error				;超出4次跳转至error
	mov	ah, 0
	mov	dl, 0				;A盘
	int	13h					;重置驱动器
	jmp	retry

next:
	mov	ax, es
	add	ax, 20h				;内存地址后移200h
	mov	es, ax
	add	cl, 1
	cmp	cl, 18
	jbe	readloop			;cl<=18
	mov	cl, 1
	add	dh, 1
	cmp	dh, 2
	jb	readloop
	mov	dh, 0
	add	ch, 1
	cmp	ch, 10				;CYLS EQU 10
	jb	readloop

fin:
	hlt						;CPU停止
	jmp	fin					;无限循环

error:
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

msg:
	db	0a0ah				;换行两次
	db	"error loading"
	db	0ah					;换行
	db	0

times	510-($-$$) db	0	;填充剩余空间使得生成文件为 512 字节
	dw	0xaa55