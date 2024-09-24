# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00280102\] |
| 1-2        | u64 programID              |
| 3          | NsDataId                   |
| 4-5        | u64 offset                 |
| 6          | Size                       |
| 7          | (Size \<\< 4) \| 0xC       |
| 8          | Data Pointer               |

# Response

| Index Word | Description         |
|------------|---------------------|
| 0          | Header code         |
| 1          | Result code         |
| 2          | Actual read size    |
| 3          | Unknown output u32. |

# Description

This is similar to [BOSSU:ReadNsData](BOSSU:ReadNsData "wikilink").