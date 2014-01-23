default :
	make boot.img

boot.bin : SOSipl.asm Makefile
	nasm SOSipl.asm -o boot.bin
SOS.sys : SOS.asm Makefile
	nasm SOS.asm -o SOS.sys
boot.img : boot.bin SOS.sys Makefile
	dd if=/dev/zero of=boot.img bs=512 count=2880
	dd conv=notrunc if=boot.bin of=boot.img
	hdiutil attach boot.img
	cp SOS.sys /Volumes/SmallOS0001
	hdiutil eject /Volumes/SmallOS0001