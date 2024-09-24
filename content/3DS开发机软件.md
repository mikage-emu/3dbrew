本页是对3DS开发机的可用软件与功能的说明。翻译自[3DS_Development_Unit_Software](3DS_Development_Unit_Software "wikilink")

以下说明除特别声明的部分，都来自SDK的37904版本。想看3DS开发机硬件信息，请访问这里[Gbatemp上的开发机硬件信息（英文）](http://gbatemp.net/topic/327858-3ds-development-hardware/)
<img src="CTR_HMN_DEV.png" title="CTR_HMN_DEV.png" width="300"
alt="CTR_HMN_DEV.png" />

## Dev Menu - 开发机主菜单

<figure>
<img src="Devmenuicon.png" title="File:Devmenuicon.png" />
<figcaption><a
href="File:Devmenuicon.png">File:Devmenuicon.png</a></figcaption>
</figure>

<img src="Devmenscnsht.jpg" title="Devmenscnsht.jpg" width="250"
alt="Devmenscnsht.jpg" />
<img src="Old_Dev_Menu.png" title="Old_Dev_Menu.png" width="200"
alt="Old_Dev_Menu.png" />
这个应用在上屏显示开发机菜单的固件和版本，在[TWL(DSi)
NAND分区](Flash_Filesystem#TWL_partition "wikilink")和[SD卡](SD_Filesystem "wikilink")有效时候显示剩余空间。它也显示了下屏导航窗口所选中磁盘/文件的信息。下屏显示的三个选项卡分别是：

- Programs-可以从[NAND](Flash_Filesystem "wikilink")，[SD
  card](SD_Filesystem "wikilink")和slot 1
  卡槽(仅仅对一部分应用程序有效，请看下方的 Dev
  Menu版本和对应范围的应用程序)读取应用程序。程序会依照"专有ID'
  '[产品号码](Serials#Product_Code "wikilink")'"的格式显示。安装过的Title可以从menu中移除。

<!-- -->

- Import-此选项卡中,可以安装SD卡中编译为.[CIA](CIA "wikilink")文件的title
  (在新版中为"SDMC")。

<!-- -->

- HIO- 这是新版Dev Menu增加的选项卡。会输出'Not found DEVMENU_ROOT'.
  This 'DEVMENU_ROOT' is not supposed to be on the 3DS' SDMC.
  (可能需要从CTR调试器的SDMC卡槽，或者NAND加载某个目录？)

<!-- -->

- ExtData-用这个选项卡可以删除包括3DS的所有[ExtData](Extdata "wikilink")。

(注意所有的零售版3DS游戏都不会被3DS开发机识别，Dev
Menu会在'Programs'中显示"Unknown Card"，并且不会在上屏提供其他信息。)

(另外注意，如果一个3DS可执行文件，由于运行受到flag限制\[比如内存限制,限制\]而不能在Dev
Menu启动的话，产品ID会用黑底红字显示出来。)

| Dev Menu版本     | 可用的Title类型                      |
|------------------|--------------------------------------|
| ?- 32640 - 33437 | 0000(仅支持NAND),0010,8004,8005,8011 |
| 35887            | 0000(仅支持NAND),8004                |
| 37785 - 40909 -? | 0000(NAND和SDMC),8004                |
| ?- 47586 -?      | 0000(NAND和SDMC),0002, 8004          |

## Config - 设置

<figure>
<img src="Configicon.png" title="File:Configicon.png" />
<figcaption><a
href="File:Configicon.png">File:Configicon.png</a></figcaption>
</figure>

<img src="3DS_dev_configmenu.JPG" title="3DS_dev_configmenu.JPG"
width="250" alt="3DS_dev_configmenu.JPG" />
该应用程序是一个3DS设置菜单，具有以下选项：

- Reset Settings - 恢复所有设置到默认。

<!-- -->

- Hid Setting - (HID = human interface
  device，人体学界面设备)校准十字键和摇杆。

<!-- -->

- Rtc Setting - (RTC = real time clock，实际时间时钟)设定系统时间。

<!-- -->

- Lcd Setting - 有和Home
  Menu一样的显示设置，以及闪烁设置(似乎是指屏幕频率刷新造成的闪烁)。

<!-- -->

- User Info Setting - 允许更改用户名，以及设置"NG NAME FLAG"标志的真假。


在最近版本的设置中，"User Info Setting"还有：

:\*CountryId -
在安装的国家中更改3DS的所在国家。(和下方的那个一样都是说3DS用户地理位置)

:\*RegionId - 在选定的国家中更改所在地区。

- Other Setting(打开到其他选项的分支) -

:\*Sound Mode - 设定声音模式，mono/stereo/surround(单声道/立体声/环绕声)

:\*System Mode - 更改内存限制。

::\*Prod - 64MB内存模式([Home
Menu](Home_Menu "wikilink")只能在此模式下运行，*绝大部分*的零售机设备都不能从此模式换到别的模式。)

::\*Dev1 - 96MB内存模式

::\*Dev2 - 80MB内存模式

::\*Dev3 - 72MB内存模式

::\*Dev4 - 32MB内存模式



所有的CTR调试器/原型机都可以更改内存限制。对于开发者测试机，更改内存限制的能力，似乎和购买测试机时候的某个选项有所关联。(就好像在从Nintendo购买IS_Nitro时候，有一个选项是否购买IS_Nitro的无线/USG选项。)

某些测试机可以在Prod之外的模式下运行[Home
Menu](Home_Menu "wikilink")，不过有些带有内存限制的应用程序(比如浏览器)不能在Prod之外的Home
Menu下启动。

:\*Exception handler - (enable/disable -
是/否)选择是否开启非调试环境下应用程序的异常处理功能。

:\*Break Stop - (enable/disable -
是/否)选择是否在非调试环境下遇到断点便停止程序。当应用程序未被要求停止时会在断点处退出。

:\*Menu - (Home Menu/Test Menu -
主菜单界面/测试界面)该功能通过修改开发机的菜单TID中[configuration](Config_Info_Blocks "wikilink")字段，允许用户从[Home
Menu](Home_Menu "wikilink")和[Test
Menu](3DS_Development_Unit_GUI#Test_Menu "wikilink")之间选择，之后菜单会被[NS](NS "wikilink")模块加载。

:\*Language - 和[System
Settings](System_Settings "wikilink")中的语言选项基本相同，不过还可以选择"无效"。

:\*Dlp Force Child Import - (enable/disable -
是/否)一般情况下，3DS会在NAND上缓存"Download Play
(Dlp)"应用程序，只有在请求版本高于本地缓存时候才重新下载并覆盖到NAND。开启这个选项，会强制3DS下载并覆盖到NAND，而不管当前版本。当然这是为测试提供的。

:\*Debug Mode - (enable/disable - 是/否)勾选调试模式？


在最近版本的设置中，"Other Setting"还有：

:\*FS Latency Emulation -
文件系统延迟，单位毫秒(0ms-2550ms)。选择时候每次增加10ms(如0ms-\>10ms-\>20ms...)。

:\*Coppacs Setting - 未知(总显示'not restricted')

- Test Setting - 测试并校准十字键和摇杆。

<!-- -->

- Eula Setting - 允许用户更改"Agree
  Version"也就是"ff.ff"。两个字段可以互换组合，值从aa到99(默认的00.00不支持Eula).

<!-- -->

- Stereo Camera Cal for Check - 相机测试(?)，可以选择"write strange
  data(excess Z-rot) - 书写特殊数据(?)"和"reset to factory default -
  恢复到出厂设置"。

<!-- -->

- Gyro / Accel Cal for Check - 允许校准陀螺仪和加速计步器。

<!-- -->

- Ctr Info Setting - 可以更改SD卡上ctrsetting.txt文件里的设置。

## Downloadplay Client - 单卡联机客户端

<img src="Dlpcliscnsht.jpg" title="Dlpcliscnsht.jpg" width="250"
alt="Dlpcliscnsht.jpg" />
![<File:Dlpcliicon.png>](Dlpcliicon.png "File:Dlpcliicon.png")

3DS开发机也有和零售版3DS[单卡联机](单卡联机 "wikilink")看上去一致的[单卡联机](单卡联机 "wikilink")应用程序，并且单卡联机客户端可以当做普通[单卡联机](单卡联机 "wikilink")（即Downloadplay）应用程序的替代品安装，但是3DS开发机和零售版3DS不能相互接收游戏。这个开发机应用程序可以看做加有以下限制的单卡联机。

- 只能下载3DS的Downloadplay Title

<!-- -->

- 没有普通Downloadplay的图形界面(请看截图)

<!-- -->

- 可以选择至多16个Downloadplay服务端

这个应用程序显然用于简单地测试Downloadplay客户端子应用，没有像普通Downloadplay恼人的
re-navigating 接口。

## Network Settings - 网络设置

<img src="Netsetscnsht.jpg" title="Netsetscnsht.jpg" width="250"
alt="Netsetscnsht.jpg" />
![<File:Netseticon.png>](Netseticon.png "File:Netseticon.png")

该开发机应用程序允许用户直接修改三个可能的网络设置"插槽"的以下内容。

- Security Mode :(无线网络所使用的加密) OPEN/WEP 40bit/WEP
  104bit/128bit/WPA TKIP/WPA2 TKIP/WPA AES/WPA2 AES

<!-- -->

- SSID :(网络名称) 最多32个字符

<!-- -->

- KEY :(加密所使用的明文) 最大许可长度和加密类型有关。

<!-- -->

- AutoDNS :(3DS是否自动获取DNS) \|True - 3DS会去自动获得\|False -
  3DS使用用户提供的DNS(这里也可以修改)\|

在设置的最下方有两个选择：

- Write Setting & Connect Test To AP -
  应用上方的选项设置，并执行一次网络连接测试(注意在原本系统设置中为修改的网络连接的设置，没有在上方出现的设定视为无效，比如说代理服务器设置)

<!-- -->

- Remove Setting - 移除这个"插槽"的所有设定

## SaveDataFiler - 存档数据文件管理

<img src="Saveflscnsht.jpg" title="Saveflscnsht.jpg" width="250"
alt="Saveflscnsht.jpg" />
![<File:Saveflicon.png>](Saveflicon.png "File:Saveflicon.png")

这个3DS开发机应用程序允许用户将存档文件或者extdata从SD卡导入导出。窗体有三个界面：

- User -
  这里可以将3DS应用程序和3DS游戏卡带(不是DS游戏卡带)的存档导出到SD卡。存档不能从这里删除。

<!-- -->

- ExtData -
  这里可以将应用程序的ExtData删除，或者导出到SD卡以便之后使用。

<!-- -->

- SD -
  这里可以将SD卡上ExtData或者应用程序的存档导入到3DS或者3DS游戏卡带中。另外也可以从SD卡删除Extdata或应用程序存档。

用户的存档会导出到sdmc:/filer/UserSaveData/YYYYMMDD(时分秒)

它会在那个路径建立一个文件夹和三个文件。导出到上方路径的两个文件是<uniqueID>.dat和<uniqueID>_.dat，另有一个名为/<uniqueID>/的目录，内有<ExHeader Name>.dat文件。

## CTR MenuSelector - CTR菜单选择器

<img src="MenuSelector.png" title="MenuSelector.png" width="120"
alt="MenuSelector.png" />
![<File:Menuselectoricon.jpg>](Menuselectoricon.jpg "File:Menuselectoricon.jpg")

这个应用程序，可以利用更改菜单线程控制符(TID)的[设置](Config_Savegame "wikilink")区域更改当前的'活动中菜单'(正在使用的那个)，允许用户从[主菜单](Home_Menu "wikilink")和[测试菜单](3DS_Development_Unit_GUI#Test_Menu "wikilink")选择，之后用[NS](NS "wikilink")模块加载菜单。这个应用程序是[设置菜单](3DS_Development_Unit_Software#Config "wikilink")作为"菜单"选择功能引入的，之后从中分离为一般的应用程序。

## CecLotcheckTool - CEC内容检查工具

<img src="Ceclotscnsht.jpg" title="Ceclotscnsht.jpg" width="250"
alt="Ceclotscnsht.jpg" />
![<File:Cecloticon.png>](Cecloticon.png "File:Cecloticon.png")

这个应用程序可以为最多12个3DS应用程序管理CECs(随机遭遇通讯，也就是StreetPass)。应用程序有12个可能的插槽，可以存入"盒子(BOXes)"。盒子是为允许用户使用CECs的应用程序单独提供的，比如StreetPass
Mii Plaza或者Nintendo 3DS
Sound。因而，这个应用程序的盒子，和'系统设置'中的'StreetPass管理'是对应的(StreetPass管理可以在零售版3DS上使用)。该应用程序的功能有：

- <Y> BOX Options - 会打开一个子目录有以下选项(当悬停在Nintendo 3DS
  Sound的盒子，也就是我当前唯一可以测试应用程序的位置)：

<!-- -->

- Box Info - 给出发件箱参数
  <img src="Boxinf.jpg" title="Boxinf.jpg" width="250" alt="Boxinf.jpg" />

<!-- -->

- Message Info (OUT-BOX) - 给出当前盒子的消息参数
  <img src="Mesinf.jpg" title="Mesinf.jpg" width="250" alt="Mesinf.jpg" />

<!-- -->

- Dummy Message Settings - 还真不太清楚这个选项干什么(空信息设置？)
  <img src="Dummesinf.jpg" title="Dummesinf.jpg" width="250"
  alt="Dummesinf.jpg" />

<!-- -->

- <A> Create Dummy BOXes -
  建立空盒子，用于填充没使用的插槽，但是不会覆盖当前的任何盒子。

<!-- -->

- <X> Delete BOXes - 从插槽中删除所有的盒子。

<!-- -->

- <START> CEC Filter Reset -
  我只能猜到这个估计是用于清除启用CEC的应用程序的数据的。

## BossLotCheckTool - BOSS内容检查器

<img src="Bosslcscnsht.png" title="Bosslcscnsht.png" width="100"
alt="Bosslcscnsht.png" />
![<File:Bosslcicon.png>](Bosslcicon.png "File:Bosslcicon.png")

该应用程序适用于管理使用了BOSS交流功能的3DS
Titles的BOSS(SpotPass)任务和数据，比如'Pokedex'应用程序就有用到BOSS交流功能。该应用程序也会显示3DS的朋友码(FC)，而这个FC并不会和3DS本身在'朋友列表'的FC相混淆。用户可以用特有ID查看3DS中登记使用BOSS功能的(除过系统部分的)Title。对每一个Title你都可以查看和BOSS下载协作的下载过的'NsData'信息。，查看BOSS任务列表(这意味着应用程序可以进行多个BOSS项目)。你可以查看关于每一个BOSS任务的信息，包括：

- TaskStatus : 任务完成了么?
- TaskExecCount : 这个BOSS任务执行了多少次
- TaskExecInterval : 在内部这个任务执行需要多少时间(单位秒)
- TaskPriority : 是一个用于形容优先级的数值
- URL : BOSS内容的URL
- AP Info : 什么都不是么？
- TaskResultCode : 任务成功了么？
- HTTP_StatusCode : HTTP的状态码
- DataSize : 内容长度(单位字节)
- Last_Modified : 最后一次(在服务器端)BOSS内容修改的时间
- StartTime : BOSS任务的登记时间
- OptOut : 用户是否可以选择退出该任务的BOSS交流

这里同样允许手动执行BOSS任务。

## Stereo Camera Calibrator - 立体相机校准器

<img src="Stecamscnsht.png" title="Stecamscnsht.png" width="100"
alt="Stecamscnsht.png" />
![<File:Stecamicon.png>](Stecamicon.png "File:Stecamicon.png")

所谓立体相机校准器(SCC)，简单来说，允许用户调整外部两个摄像头之间的关系。可以用3DS距离特殊物件一段距离的方法自动设置，也可以手动设置每个相机图片的旋转角度和右眼相机的大小。3D效果可以通过重叠半透明的右眼相机图像和左眼相机图像来观察，或者也可以直接利用3DS的视差屏障来观察3D图像。

## Model Viewer - 模型查看器

<img src="ModelViewer.png" title="ModelViewer.png" width="100"
alt="ModelViewer.png" />
![<File:ModelViewericon.png>](ModelViewericon.png "File:ModelViewericon.png")

如名字所示，这个应用程序允许用户查看模型。它需要和CTR调试器配合使用，以便于可以将到模型输入程序内存。不过程序可以在测试机上运行，而模型限定为三条彩色线描述三个维度(x,y,z)。模型也可以旋转或放缩，查看方式分别可以用摇杆和十字键。当然了这个应用程序利用了3D机能。

## Friend Testing Partner - Friend 调试器

<img src="Ftestpscnsht.png" title="Ftestpscnsht.png" width="250"
alt="Ftestpscnsht.png" />
![<File:Ftestpicon.png>](Ftestpicon.png "File:Ftestpicon.png")

Friend Testing Partner 应用用于测试/监听3DS的Friend
List功能.它允许用户通过以下选项测试3DS的 out-going Friend
Card的一系列功能:

- Master Control - (RUN/STOP) (默认STOP)当 3DS Friend Card设置为 ‘STOP’
  时使用用户的 settings/data.设置为 ‘RUN’时3DS Friend Card
  使用虚拟的settings/data测试以下设置.

<!-- -->

- Login/Logout - (ON/OFF) (默认ON) 在 Friend Card 中的作用未知.

<!-- -->

- Playing Title - (ON/OFF) (默认ON) ‘ON’
  状态时忽略当前使用的title,使用虚拟应用作为 ‘Playing Title’
  ,约每10秒循环一次. 在固件版本1.0.0-0 的零售版 3DS的 ‘Nintendo Zone
  viewer’ 应用中发现了这个虚拟应用程序.‘OFF’状态时使用(Friend Testing
  Partner)当前使用的title作为 ‘Playing Title’

<!-- -->

- Mode Description - (ON/OFF) (默认ON) ‘ON’状态时从用户3DS的(Playing
  Title) 可以看到日期和时间. Mode Description十秒左右刷新一次.
  ‘OFF’状态用户的日期和时间就不会显示出来了.

<!-- -->

- Message - (ON/OFF) (默认ON) ‘ON’状态时,
  用户发出的消息会被当前日期时间替代(如果返回用户的选择为‘OFF’就不替代了)
  ,时间格式为 “YYYYMMDD HHMMSS”,十秒左右刷新一次.

<!-- -->

- Mii - (ON/OFF) (默认ON)
  'ON'使用4个虚拟Mii中的一个作为Mii与一个新的Mii十秒左右通信一次.这个效果可以使用不是host的3DS观察到.

<!-- -->

- Favorite Title (ON/OFF) (默认ON)'ON'状态时,用户的favorite
  title会被虚拟的title替代,十秒左右更换一次,应用允许用户监听其他3DS是否在线,以及3DS基友是否在线.每次虚拟设置被刷新，屏幕上都会留下时间记录.

## Game Coin Setter\* - 游戏金币设置器\*

<img src="Coinstscnsht.png" title="Coinstscnsht.png" width="100"
alt="Coinstscnsht.png" />
![<File:Coinsticon.png>](Coinsticon.png "File:Coinsticon.png")

这个程序用于设置3DS游戏金币的数值。显然这是为了开发者能测试自己游戏中，玩家用获得的游戏金币换取游戏内内容或类似东西的部分。它用一个非常简单的界面显示了当前金币数量，调整选项，目标金币数量。下面是操作说明：

- LEFT/RIGHT - 十字键只能修改'目标金币数量'（0~300）。

<!-- -->

- A - 把用户修改的‘目标金币数量’设置为'当前金币数量'。

<!-- -->

- L+R+X - "今天不再增加"("Preclude today's
  Increment")不知道这到底怎么影响到游戏金币数量的。

## TWL开发工具

以下是用于DSi/DS模式的开发工具，能把应用打包为可安装到TWL
NAND的[CIA](CIA "wikilink")文件。

### NINTENDO DS - WMtest - NDS无线测试

<img src="Wmtestscnsht.jpg" title="Wmtestscnsht.jpg" width="300"
alt="Wmtestscnsht.jpg" />
![<File:Wmtesttool.png>‎](Wmtesttool.png‎ "File:Wmtesttool.png‎")

该应用是为3DS使用而编译的TWL(DSi)应用。它是一个无线测试工具，功能如下：

- Scan Test -
  搜索无线频道1-13(也可以专门搜索一个频道)，寻找多播点。它可以探测到两种类型的多播点：

Wifi热点 - 输入Mac地址，频道，'c'和SSID

DS Stations - ( 比如DS Download station和Pokemon
distributor)输入Mac地址，频道，TGID和GGID

- ScanEx Test -
  同时具备两种扫描类型。被动型让你选择单独扫描频道1-13中的一个 DS
  distribution(1,7,13这三个)。主动型会同时扫描所有的13个频道。找到一个频道后，下屏的'Found'旁边会显示'bssDescCount='

<!-- -->

- MeasureChannel Test -
  不是很清楚做什么的，但是输入一个频道后，程序会从从10ms到1000ms的范围内选择一个时间长度，使用这个值测试后，输出一个百分比。

<!-- -->

- Noise Mode -
  甄别出有干扰的频道(这个应用描述的并不很清楚)。你可以指定：

筛选出有干扰的频道

噪音程度，从0%到100%

噪声频率，从10ms到50ms

筛选模式，1000ms到1500ms

选择好设置后，上屏幕会显示两个噪声计数器，分别为'Noise ON count'和'Noise
OFF count'。在噪声为0%的时候'Noise ON
count'几乎不变，而噪声接近100%时计数器数值会飙升。对于'Noise OFF
count'，和'Noise ON count'的计数情况正好相反。(大概就是指数函数的样子)

------------------------------------------------------------------------

\*
这里使用了另外的图标换掉了应用原本的图标，以免和其他应用程序混淆。原来的图标可以在历史页面查看。

[Category:3DS Development Unit Related
Pages](Category:3DS_Development_Unit_Related_Pages "wikilink")