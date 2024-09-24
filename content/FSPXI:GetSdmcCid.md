+++
title = 'FSPXI:GetSdmcCid'
+++

# Request

| Index Word | Description                                        |
|------------|----------------------------------------------------|
| 0          | Header code \[0x001E0042\]                         |
| 1          | Output CID size (always 0x10)                      |
| 2          | Always 0x00001004, for 0x10 size: (size\<\<8) \| 4 |
| 3          | Output 0x10-byte CID pointer                       |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

The CID retrieved by this is the same as the ID1 in the [sdmc/Nintendo
3DS/<ID0>/<ID1>](SD_Filesystem "wikilink") directory.
