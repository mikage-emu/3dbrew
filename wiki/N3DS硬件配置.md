本页面列出并描述3DS中已发现的硬件。许多元器件是专门订制的，需要查看本页或其他页的说明。

## 规格

| 类型           | 名称                                                           | 参考数据                                                                                                                                                                           | 来源    |
|----------------|----------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------|
| SoC            | Nintendo 1048 0H (订制): CPU, GPU, VRAM & DSP 集成在一颗芯片上 | N/A                                                                                                                                                                                | N/A     |
| Processor Core | ARM11 MPCore 2x 268MHz & 2x VFP Co-Processor                   | [1](http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ddi0360f/index.html)                                                                                               | \[11\]  |
| GPU            | [DMP PICA](http://en.wikipedia.org/wiki/PICA200) 268MHz        | N/A                                                                                                                                                                                | \[11\]  |
| DSP            | 134Mhz. 24ch 32728Hz采样率                                     | N/A                                                                                                                                                                                | \[11\]  |
| VRAM           | 6 MB，集成在SoC中。独立的系统内存(FCRAM).                      | N/A                                                                                                                                                                                | \[11\]  |
| FCRAM          | 2x64MB Fujitsu MB82M8080-07L                                   | [2](http://crediar.no-ip.com/sg_/download.php?id=d67d1c)[3](http://edevice.fujitsu.com/fj/DATASHEET/e-ds/e511463.pdf)[4](http://edevice.fujitsu.com/jp/datasheet/j-ds/j511463.pdf) | \[5\]   |
| 存储器         | Toshiba THGBM2G3P1FBAI8 1GB NAND Flash                         | N/A                                                                                                                                                                                | N/A     |
| 电源管理       | Texas Instruments PAIC3010B 0AA37DW                            | N/A                                                                                                                                                                                | FCC归档 |
| 螺旋仪         | Invensense ITG-3270 MEMS Gyroscope                             | [5](http://dl-web.dropbox.com/u/20520664/references/PS-ITG-3200-00-01.4.pdf)                                                                                                       | N/A     |
| 加速度计       | ST Micro 2048 33DH X1MAQ Accelerometer Model LIS331DH          | [6](http://dl.dropbox.com/u/20520664/references/CD00213470.pdf)                                                                                                                    | N/A     |
| 无线网卡       | 802.11b/g Atheros AR6014                                       | [7](http://www.db.pokestation.net/3DS/Wi-Fi%20module%20pinouts.pdf)                                                                                                                | N/A     |
| 红外芯片       | NXP infrared IC, "S750 0803 TSD031C"                           | N/A                                                                                                                                                                                | \[10\]  |
| 辅助微处理器   | Renesas Electronics UC CTR, custom Nintendo microcontroller    | N/A                                                                                                                                                                                | N/A     |

- \[11\]参考官方文档

<!-- -->

- \[5\],\[10\]根据iFixit.com
  ([来源](http://www.ifixit.com/Teardown/Nintendo-3DS-Teardown/5029/1#s22696))的信息。

<!-- -->

- 内存的数据参考了同系列芯片，容量要比3DS内置的小(128Mbits VS
  512Mbits)。

<!-- -->

- 在FCC的网站上，还有一堆相关信息。你可以访问[8](https://fjallfoss.fcc.gov/oetcf/eas/reports/ViewExhibitReport.cfm?mode=Exhibits&RequestTimeout=500&calledFromFrame=N&application_id=462292&fcc_id=%27EW4DWMW028%27)(链接已经过期)。

## FCRAM

3DS使用了一个富士通制造的快速循环随机存储器(FCRAM)芯片，型号MB82M8080-07L。富士通MB82M8080-07L芯片内部封装了型号为MB81EDS516545和MB82DBS08645的两个元件。

MB81EDS516545元件是CMOS工艺的FCRAM，有SDRAM接口的512MBit/64位低功耗内存(LPDDR)。MB81EDS516545切合消费级应用的低功耗高带宽要求。

## SoC

3DS和先前的DS机种一样,SoC封装复杂。这样可以降低成本，减少功耗，简化PCB布线，提高入侵系统的门槛。SoC型号为Nintendo
1048 0H，包含了CPU，GPU，DSP和VRAM。

根据官方文档，这个CPU是双核ARM11，时钟频率268MHz。其中一个核心专门负责系统软件，另一个则用于应用程序，就是所谓系统核心和应用核心。

## GPU

如上方已经提到的那样，是DMP(Digital Media Proffesionals)公司生产的PICA
200，时钟268MHz，支持OpenGL ES 1.1。

<figure>
<img src="Pica200BlockDiagram.png" title="PICA200模块图解" />
<figcaption>PICA200模块图解</figcaption>
</figure>

基于PICA 200的ULTRAY2000(DMP)模块图

## 图片

### 正面

<figure>
<img src="CTR_Front.jpg" title="CTR_Front.jpg" width="600" />
<figcaption>CTR_Front.jpg</figcaption>
</figure>

[高清版](http://guide-images.ifixit.net/igi/ishJaSCOwLkvbLYK)

### 背面

<figure>
<img src="CTR_Back.jpg" title="Image:CTR_Back.jpg" />
<figcaption>Image:CTR_Back.jpg</figcaption>
</figure>

[高清版](http://guide-images.ifixit.net/igi/n1CKAdbPrHyNPNuW)

### NAND引脚

<figure>
<img src="CTR_NAND_pinout.png" title="Image:CTR_NAND_pinout.png" />
<figcaption>Image:CTR_NAND_pinout.png</figcaption>
</figure>

NAND dumping业已成功，但仅获得加密镜像。

### WiFi附件引脚

<figure>
<img src="CTR_WiFiDongle_pinout.png" title="CTR_WiFiDongle_pinout.png"
width="600" />
<figcaption>CTR_WiFiDongle_pinout.png</figcaption>
</figure>

SDIO(安全数字输入输出卡)接口标记红色：

- CLK
- CMD
- D0, D1, D2, D3

这是首先从DSi引入的'新'Wifi模块(基于Atheros AR6002)。

过去的专有的DS模式Wifi标记黄色，引脚未知。

I2C(内部整合电路，一种串行通讯总线)的EEPROM标记蓝色：

- SCL
- SDA

SPI(一种高速的全双工同步性通信总线)的闪存标记紫色：

- CLK
- CS#
- SI
- SO
- WP#
- NC

### 辅助处理器

<figure>
<img src="CTR_UC.png" title="CTR_UC.png" width="600" />
<figcaption>CTR_UC.png</figcaption>
</figure>

监控HOME按钮、Wifi开关、3D景深滑块、音量滑块的状态，控制LED，以及供电支持。

连接到I2C总线的设备：

- UC (主状态?)
- Accelerometer (从状态，地址0x18)
- SoC (主从未知?)