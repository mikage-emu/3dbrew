# Request

| Index Word | Description                        |
|------------|------------------------------------|
| 0          | Header code \[0x001D0042\]         |
| 1          | Size                               |
| 2          | Value 0x20 (processID header)      |
| 3          | ProcessID set by the ARM11 kernel. |

The following is located 0x100-bytes after the beginning of the above
command buffer:

| Index Word | Description                 |
|------------|-----------------------------|
| 0          | (Size\<\<14) \| 2           |
| 1          | Pointer to output structure |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
| 2          | ?           |

# Output structure

| Offset | Size | Description |
|--------|------|-------------|
|        |      |             |

# Description

This returns data from parsing the output of
[NWMINF:RecvBeaconBroadcastData](NWMINF:RecvBeaconBroadcastData "wikilink").