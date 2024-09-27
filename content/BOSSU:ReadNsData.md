+++
title = 'BOSSU:ReadNsData'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00280102\] |
| 1          | NsDataId                   |
| 2-3        | u64 offset                 |
| 4          | Size                       |
| 5          | (Size \<\< 4) \| 0xC       |
| 6          | Data Pointer               |

# Response

| Index Word | Description         |
|------------|---------------------|
| 0          | Header code         |
| 1          | Result code         |
| 2          | Actual read size    |
| 3          | Unknown output u32. |

# Description

This is used for reading the actual SpotPass content.