+++
title = 'PXIDEV:ReadCTRCARD Cmd40'
+++

# Request

| Index Word | Description                                                   |
|------------|---------------------------------------------------------------|
| 0          | Header code \[0x000101C2\]                                    |
| 1          | Buffer Size                                                   |
| 2          | Sector Count                                                  |
| 3          | u8, [SectorSize](Gamecard_Services_PXI#SectorSize "wikilink") |
| 4-7        | Command                                                       |
| 8          | (Size \<\< 8) \| 0x4                                          |
| 9          | Buffer Pointer                                                |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Reads from CTRCARD. The command written to the
[CTRCARD_CMD](CTRCARD_Registers#CTRCARD_CMD "wikilink") register is the
same as provided, except the highest byte is changed to 0x40.
