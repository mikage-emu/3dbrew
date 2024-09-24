+++
title = 'AM:GetTwlArchiveResourceInfo'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00200000\] |

# Response

| Index Word | Description                                                  |
|------------|--------------------------------------------------------------|
| 0          | Header code                                                  |
| 1          | Result code                                                  |
| 2-9        | [TwlArchiveResourceInfo](#twlarchiveresourceinfo "wikilink") |

# TwlArchiveResourceInfo

| Offset | Size | Description            |
|--------|------|------------------------|
| 0x00   | 0x8  | u64, Total Capacity    |
| 0x08   | 0x8  | u64, Total Free Space  |
| 0x10   | 0x8  | u64, Titles Capacity   |
| 0x18   | 0x8  | u64, Titles Free Space |