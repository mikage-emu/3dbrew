漏洞可以用于在N3DS上用来运行非官方代码（homebrew
自制程序）。本页面记录已经发现的3DS模式下的漏洞，译自[3DS_exploits](3DS_exploits "wikilink")。

## N3DS漏洞列表

## 失败的尝试

这里是之前发现的漏洞以及它们的具体信息。

- Pushmo（3DSWare软件）
  QR码：关卡名称很可能限制在16个字符长。名字过长不能造成游戏崩溃。唯一可能由溢出而触发的崩溃，是应用程序尝试从位于NULL的缓冲区加载一个指针。
- Pyramids（3DSWare软件)
  QR码：没有字符串，LZ10的压缩算法也不能用于运行程序。仅在超出外部极限值的情况下崩溃（类似于背景数据），同样不能用于运行程序。
- 3DS网络浏览器：在输入2^32长度字符串后崩溃，漏洞定位到了
  [这里](http://git.chromium.org/gitweb/?p=external/Webkit.git;a=commitdiff;h=ec471f16fbd1f879cb631f9b022fd16acd75f4d4),
  concat-large-strings-crash2.html 触发崩溃，这和2^32触发崩溃一样。
  多数时候这个漏洞造成内存分页权限错误，因为webkit厂商复制字符串数据到只读内存的缓冲区。区别只在前者企图复制原字符串长（比如一个text字符为“x”，4个就是“xxxx”），而后者尝试复杂超过12MB的数据。在一些少见的情况里，崩溃的是复制字符串的线程，但是这没用，因为它是一个少见的情况。

## 正在进行的努力

目前有很多人在尝试寻找漏洞并对3DS内部的文件进行文档整理。以下是一些可能会让自制程序成功运行的一些尝试：

- Neimod已经研究了很长时间如何dump出RAM的数据，他拆解了N3DS的原配RAM芯片，然后把它重新焊在一块PCB板上，焊回3DS进行dump测试。最近的照片表示进程很顺利，可以成功启动3DS了。Neimod的成果相关图片可以在这里查看[Flickr
  stream\|他的Flickr账户](http://www.flickr.com/photos/neimod/his).

## 技巧和信息

3DS使用的ARM处理器XN功能的唯一一个应用程序，头部有必要的权限可以设置为可执行的内存。这意味着一个可用的缓冲区溢出漏洞，虽然是有用的，
it would not go the entire way towards allowing code to be run in an
easy/practical fashion (ie an actual homebrew launcher) - for that, an
exploit in the system is required. A buffer overflow exploit does,
however, provide enough wriggle room through the use of return-oriented
programming to potentially trigger a system exploit.

游戏机的console-unique
[movable.sed](Nand/private/movable.sed "wikilink") dump后，SD 卡
[extdata](extdata "wikilink") 和 SD [游戏存档](游戏存档 "wikilink")
可以用于攻击。