任天堂给开发者提供了一个与某些services通讯的API。这里说的services(服务)是后台运行着，等待接受请求的系统进程。一个进程要同服务通讯，需要先获得这个服务的句柄，才能和服务进行进程间通讯。每个服务都有一个不超过8字符的名称，如"nim:u"。

服务的句柄是从服务管理端口"srv:"处获得的。服务作为抽象的端口，两者操作基本相同，除了一般端口可以从SVC直接获得句柄。

服务列表：

- [文件系统服务](Filesystem_services‎ "wikilink")
- [进程服务‎](Process_Services "wikilink")
- [应用管理服务](Application_Manager_Services "wikilink")
- [Process Manager Services](Process_Manager_Services "wikilink")
- [网络安装管理(NIM)服务](NIM_Services "wikilink")
- [设置服务](Config_Services "wikilink")
- [NS和APT服务](NS "wikilink")
- [运行时对象(RO)服务](RO_Services "wikilink")
- [NDM服务](NDM_Services "wikilink")
- [CSND Services](CSND_Services "wikilink")
- [DSP Services](DSP_Services "wikilink")
- [GSP服务](GSP_Services "wikilink")
- [IR服务](IR_Services "wikilink")
- [I2C服务](I2C_Services "wikilink")
- [HID服务](HID_Services "wikilink")
- [PTM Services](PTM "wikilink")
- [NWM Services](NWM_Services "wikilink")
- [HTTP Services](HTTP_Services "wikilink")
- [SSL Services](SSL_Services "wikilink")
- [Socket Services](Socket_Services "wikilink")
- [AC Services](AC_Services "wikilink")

PXI服务列表：

- [PXI文件系统服务](Filesystem_services_PXI "wikilink")
- [PXI进程服务](Process_Services_PXI "wikilink")
- [PXI应用管理服务](Application_Manager_Services_PXI "wikilink")
- [PXI进程管理服务](Process_Manager_Services_PXI "wikilink")
- [PXI开发服务](Development_Services_PXI "wikilink")
- [PXI游戏卡带服务](Gamecard_Services_PXI "wikilink")

端口列表：

- [错误显示ErrDisp](ErrDisp "wikilink")