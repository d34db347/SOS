## SOS`Small Operating System`

这几天中科院搞出来个 **COS**`China Operating System`. 反正放假在家也是闲得蛋疼, 参照[《30天自制操作系统》](http://book.douban.com/subject/11530329/)写个 **SOS**`Small Operating System`. ~~比比谁的名字更蛋疼(´,_ゝ`)~~

#### Day0
>	书中的开发环境是 Windows, 目前日常使用的操作系统为 OS X, 需要寻找替代方案. 还有书上使用的貌似是软盘, 应该能改成使用光盘启动. 总之先开个坑, 不知道能不能写下去...

#### [Day1][1]
>	用汇编写了个 boot sector 的 Hello World. [>>>][1]

#### [Day2][2]
>	查找 EFI 的资料, 配置 EDKII 开发环境, EFI 的 Hello World, 暂时编译错误. [>>>][2]

#### [Day3][3]
>	edk2 暂不支持 Mavericks, 坑暂时留着. 继续用 Legacy BIOS. [>>>][3]

#### [Day4][4]
>	使用 Makefile, 完成启动区的编写.

[1]: http://gncy2013.github.io/2014/01/19/SOS-Day1.html
[2]: http://gncy2013.github.io/2014/01/20/SOS-Day2.html
[3]: http://gncy2013.github.io/2014/01/21/SOS-Day3.html
[4]: http://gncy2013.github.io/2014/01/22/SOS-Day4.html