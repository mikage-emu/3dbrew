# Request

| Index Word | Description                                                   |
|------------|---------------------------------------------------------------|
| 0          | Header code \[0x00030102\]                                    |
| 1          | Buffer Size                                                   |
| 2          | Sector Offset                                                 |
| 3          | Sector Count                                                  |
| 4          | u8, [SectorSize](Gamecard_Services_PXI#SectorSize "wikilink") |
| 5          | (Size \<\< 8) \| 0x6                                          |
| 6          | Buffer Pointer                                                |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Writes to CTRCARD at an offset. The 32-bit words of the command written
to the [CTRCARD_CMD](CTRCARD_Registers#CTRCARD_CMD "wikilink") register
are "0x44000000 \| (SectorOffset \>\> 23), (SectorOffset \<\< 9) \|
[SectorSize](Gamecard_Services_PXI#SectorSize "wikilink"), 0, 0"