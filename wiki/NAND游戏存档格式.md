本页介绍 [Cfg](Config_Services "wikilink")
[NAND](System_SaveData "wikilink")
[游戏存档](游戏存档 "wikilink")的格式.这些块可以通过CFG服务命令来访问。

## 存档文件 "/config" 的结构

| 偏移   | 长度   | 说明     |
|--------|--------|----------|
| 0x0    | 0x2    | 总入口   |
| 0x2    | 0x2    | ?        |
| 0x4    | 0x4558 | 块入口   |
| 0x455C |        | 入口数据 |

/config文件的大小为 0x8000 byte

## 设置块入口

| 偏移 | 大小 | 说明                                                      |
|------|------|-----------------------------------------------------------|
| 0x0  | 0x4  | BlkID                                                     |
| 0x4  | 0x4  | 大小\>4时,是这个快的数据的偏移, 否则是这个块的数据的word. |
| 0x8  | 0x2  | 大小                                                      |
| 0xA  | 0x2  | 标志位                                                    |

## 设置块

| BlkID      | 大小 | 标志位 | 说明                                                                                                                                                                                        |
|------------|------|--------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x00090000 | 0x8  | 0x2?   | 包含一个u64 ID, 进程通过 [NWMUDS:Initialize](NWMUDS:Initialize "wikilink") 使用. 第一个字和[LocalFriendCodeSeed](CfgS:GetLocalFriendCodeSeed "wikilink")相同, 后边一个字是一个独立的随机字. |
| 0x00090001 | 0x8  | 0xE    | [GenHashConsoleUnique](Cfg:GenHashConsoleUnique "wikilink")使用的console-unique u64,由 LocalFriendCodeSeed和随机数生成.                                                                     |
| 0x000A0000 | 0x1C | 0xE    | 往下看吧.                                                                                                                                                                                   |
| 0x000A0002 | 0x1  | 0xA    | 语言                                                                                                                                                                                        |
| 0x000B0000 | 0x4  | 0x8    | 国家信息                                                                                                                                                                                    |
| 0x000F0000 | 0x10 | 0x8?   | 未知,dev-units的 [NS](NS "wikilink")使用[svcKernelSetState](SVC "wikilink")时 Type为6.                                                                                                      |
| 0x00110000 | 0x4  | ?      | 低U16指示是否需要进行系统设置.比如系统第一次启动时会做一次[System Format](System_Settings "wikilink"): 0=需要设置,非0=无需设置                                                              |
| 0x00110001 | 0x8  | 0xA?   | dev units的[NS](NS "wikilink")用于主画面载入的TitleID . (这个快可以在 dev units使用 [Config](3DS_Development_Unit_Software#Config "wikilink")编辑)                                          |

dev unit TID block仅存在于dev units.

### 语言

| ID  | 说明 |
|-----|------|
| 0   | ja   |
| 1   | en   |
| 2   | fr   |
| 3   | de   |
| 4   | it   |
| 5   | es   |
| 6   | zh   |
| 7   | ko   |
| 8   | nl   |
| 9   | pt   |
| 10  | ru   |

### 国家信息

| Byte | 说明                                           |
|------|------------------------------------------------|
| 0    | ?                                              |
| 1    | ?                                              |
| 2    | ?                                              |
| 3    | 国家代码,和DSi/Wii国家代码相同.值为0xff时无效. |

### 0x000A0000 Block

| Byte      | 说明                            |
|-----------|---------------------------------|
| 0x0-0x13  | UTF-16用户名, 结尾没有NULL标志. |
| 0x14-17   | 通常为0?                        |
| 0x18-0x1B | ?                               |