+++
title = 'QTM:GetHeadtrackingInfoRaw'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00010080\] |
| 1-2        | u64, normally zero         |

# Response

| Index Word | Description      |
|------------|------------------|
| 0          | Header code      |
| 1          | Result code      |
| 2..13      | Output structure |

# Structure

| Offset | Size | Description                                            |
|--------|------|--------------------------------------------------------|
| 0x0    | 0x4  | u8 flags which indicate whether the head was detected. |

The total size of this structure is 0x30-bytes.