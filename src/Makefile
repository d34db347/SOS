boot.bin : SOSipl.asm Makefile
	nasm SOSipl.asm -o boot.bin
boot.img : boot.bin Makefile
	dd if=/dev/zero of=boot.img bs=512 count=2880
	dd conv=notrunc if=boot.bin of=boot.img

img :
	make -r boot.bin
	make -r boot.img