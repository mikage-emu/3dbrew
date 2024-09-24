+++
title = 'APT:StoreSysMenuArg'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00370042\] |
| 1          | Size (capped to 0x40)      |
| 2          | (Size \<\< 14) \| 2        |
| 3          | void\*, Input Buffer       |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Structure

| Offset | Size | Description                                                                   |
|--------|------|-------------------------------------------------------------------------------|
| 0x0    | 0x4  | Type?                                                                         |
| 0x4    | 0x4  | Title Unique ID of the applet which set this SysMenuArg structure             |
| 0x8    | 0x8  | u64, Program ID of the title to launch                                        |
| 0x10   | 0x4  | ?                                                                             |
| 0x14   | 0x4  | 1 + \<bit value loaded from [Cfg](Config_Savegame "wikilink") block 0xC0000\> |

The above is the structure of the 0x18-byte buffer used with Home Menu
for StoreSysMenuArg/LoadSysMenuArg. The uniqueID is for a NAND title
with tid-high 000400030, this title must be installed in NAND. Only
certain uniqueIDs can be used here.

# Description

This copies the input buffer to [FIRM-launch
params](FIRM "wikilink")+0x500, in NS state.