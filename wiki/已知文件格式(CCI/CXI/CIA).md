下面是已知的3DS所使用的文件格式列表。

## 应用程序(任何可运行代码)

.[CCI](CCI "wikilink") - Cart image.
被烧入ROM（或被官方debug硬件载入）。包含实际的ROM
dump格式，及对3DS与卡带之间读请求的响应。

.[CXI](CXI "wikilink")
-可执行镜像。与上面相似，不同之处在于CXI程序被安装在NAND中，因此它们也从NAND中执行。

.[CIA](CIA "wikilink") - (CTR Importable Archive)
被编译进档案的应用程序，准备安装到设计好的位置。.CIA文件可被解压安装应用程序到CTR
NAND，TWL NAND(部分被DSi应用程序使用的NAND)以及SD卡上。

.[CSU](CCI "wikilink") - 系统更新. 格式随（系统）版本呈多样化。

.CFA - CTR File Archive - Externalized
ROM-FS.CXI数据与ROMFS数据被分散到一个外部文件列表而不是被编译进单一的CXI镜像（通常不使用）。Lib表明这与CIA类似，有点像一个CIA档案。幸运的是，Lib含有这种格式的某些信息。CFA文件基本上被打包进CIA中。当CCI文件包含分布下载游戏(download
play)子设备时，CFA才被使用。 （CFAs are used when the CCI file includes
the child device distributed with download play.）

.NSA - 被3DS内多种通信协议使用的文档。

.RSF - 输出CCI/CXI文件时的描述性数据。特定选项如:标题，存档格式，等等。

.AXF - 汇编前的ARM代码(Pre-assembled ARM code). 链接成CCI/CXI前的格式。

.CDI - CTR开发镜像(CTR Development
Image).Lib不包含该格式的格式、用途等等的文档，我不得不挖穿编译器来找到这种格式。希望我很快能找到更多信息。\*可能\*与CTR调试器有关，不过这只是一个猜想。

.CIP - CTR初始化进程(CTR Initial
Process).不幸的是，情形很像CDI格式，不过因为它在Lib编译器当中，所以它是3DS使用的某种格式类型。

.[BCWAV](BCWAV "wikilink") - CTR音频文件格式(CTR waveform file format)。

.[CBMD](CBMD "wikilink") - CTR二进制标题模型(CTR binary banner
model).被做成CTR游戏标题(banner，或者乃给吾一个更好的翻译)或其他应用程序前的档案文件。

### 文件系统

3DS文件系统需要绝对路径。它能处理短(8.3)和长(最长255字符)的文件名。

## MPO格式(Multi-Picture Object Format)

描述MPO文件格式的文档:
<http://www.cipa.jp/english/hyoujunka/kikaku/pdf/DC-007_E.pdf>

[任天堂的MPO标准](MPO "wikilink")