# Request

| Index Word | Description                        |
|------------|------------------------------------|
| 0          | Header code \[0x000E0042\]         |
| 1          | Size                               |
| 2          | Value 0x20 (processID header)      |
| 3          | ProcessID set by the ARM11 kernel. |

The following is located 0x100-bytes after the beginning of the above
command buffer:

| Index Word | Description                         |
|------------|-------------------------------------|
| 0          | (Size\<\<14) \| 2                   |
| 1          | Pointer to output AP info structure |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# AP info structure

| Offset | Size | Description |
|--------|------|-------------|
| 0x0    | 0x4  | SSID length |
| 0x4    | 0x20 | SSID        |
| 0x24   | 0x6  | BSSID       |
| 0x2A   | 0x2  | Padding?    |
| 0x2C   | 0x2  | ?           |
| 0x2E   | 0x2  | ?           |
| 0x30   | 0x1  | ?           |
| 0x31   | 0x1  | ?           |
| 0x32   | 0x2  | ?           |

# Description

This obtains info for the wifi AP which the system is currently
connected to.