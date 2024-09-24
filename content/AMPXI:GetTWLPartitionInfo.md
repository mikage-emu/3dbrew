+++
title = 'AMPXI:GetTWLPartitionInfo'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00540000\] |

# Response

| Index Word | Description                                      |
|------------|--------------------------------------------------|
| 0          | Header code                                      |
| 1          | Result code                                      |
| 2-9        | [TWLPartitionInfo](#twlpartitioninfo "wikilink") |

# TWLPartitionInfo

| Offset | Size | Description            |
|--------|------|------------------------|
| 0x00   | 0x8  | u64, Total Capacity    |
| 0x08   | 0x8  | u64, Total Free Space  |
| 0x10   | 0x8  | u64, Titles Capacity   |
| 0x18   | 0x8  | u64, Titles Free Space |