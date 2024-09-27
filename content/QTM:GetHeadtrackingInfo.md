# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00020080\] |
| 1-2        | u64, normally zero         |

# Response

| Index Word | Description      |
|------------|------------------|
| 0          | Header code      |
| 1          | Result code      |
| 2..17      | Output structure |

# Structure

| Offset | Size | Description                                                                                   |
|--------|------|-----------------------------------------------------------------------------------------------|
| 0x0    | 0x4  | u8 flags which indicate whether the head was detected.                                        |
| 0x4    | 0x1  | u8 flag, unknown                                                                              |
| 0x5    | 0x3  | Padding                                                                                       |
| 0x8    | 0x4  | float, not used by [System_Settings](System_Settings "wikilink").                             |
| 0xC    | 0x20 | 4 coordinate entries: head top-left, head bottom-right, head bottom-left, and head top-right. |
| 0x2C   | 0x14 | Not used by [System_Settings](System_Settings "wikilink").                                    |

The total size of this structure is 0x40-bytes.

## Coordinate entry

| Offset | Size | Description |
|--------|------|-------------|
| 0x0    | 0x4  | float x     |
| 0x4    | 0x4  | float y     |

The total entry size is 0x8-bytes. The range for these two floats are
-1.0f..1.0.f. These are relative to the center of the screen.