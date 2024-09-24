+++
title = 'Cfg:GetSystemModel'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00050000\] |

# Response

| Index Word | Description            |
|------------|------------------------|
| 0          | Header code            |
| 1          | Result code            |
| 2          | u8 output system model |

# System Model Values

| Value | Description                      | Codename string used by [ACT-sysmodule](ACT_Services "wikilink") |
|-------|----------------------------------|------------------------------------------------------------------|
|       |                                  |                                                                  |
| 0     | Nintendo 3DS                     | CTR                                                              |
| 1     | Nintendo 3DS XL                  | SPR                                                              |
| 2     | [New_3DS](New_3DS "wikilink")    | KTR                                                              |
| 3     | Nintendo 2DS                     | FTR                                                              |
| 4     | [New_3DS](New_3DS "wikilink") XL | RED                                                              |
| 5     | New 2DS XL                       | JAN                                                              |

# Description

This uses the code for
[CfgS:GetConfigInfoBlk8](CfgS:GetConfigInfoBlk8 "wikilink") to load
4-bytes from blkID [0x000F0004](Config_Savegame "wikilink"). The first
u8 from this output is written to the command-response output u8. When
this value=3 for Nintendo 2DS, this uses the code for
[CfgS:SecureInfoGetSerialNo](CfgS:SecureInfoGetSerialNo "wikilink") to
load the SerialNo. The first byte from the SerialNo must be 'A' (retail
2DS) or 'P' (devkit 2DS) when the above value is set for Nintendo 2DS,
otherwise this returns error 0xD8A10006 and clears the output u8 to
value zero.