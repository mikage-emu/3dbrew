+++
title = 'FSPXI:EnumerateSystemSaveData'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00520042\] |
| 1          | Max buffer size            |
| 2          | (Size\<\< 8) \| 4          |
| 3          | Output buffer              |

# Response

| Index Word | Description                                      |
|------------|--------------------------------------------------|
| 0          | Header code                                      |
| 1          | Result code                                      |
| 2          | Total savedata IDs written to the output buffer. |
| 3          | Value 0x4                                        |

# Description

This writes a list of u64 savedata IDs for all
[System_SaveData](System_SaveData "wikilink") in NAND, to the output
buffer.
