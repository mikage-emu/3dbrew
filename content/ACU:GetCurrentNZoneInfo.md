+++
title = 'ACU:GetCurrentNZoneInfo'
+++

# Request

| Index Word | Description                        |
|------------|------------------------------------|
| 0          | Header code \[0x00100042\]         |
| 1          | Size                               |
| 2          | Value 0x20 (processID header)      |
| 3          | ProcessID set by the ARM11 kernel. |

The following is located 0x100-bytes after the beginning of the above
command buffer:

| Index Word | Description                                                                |
|------------|----------------------------------------------------------------------------|
| 0          | (Size\<\<14) \| 2                                                          |
| 1          | Pointer to output [Nintendo Zone](Nintendo_Zone "wikilink") info structure |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Output NZone Structure

| Offset | Size | Description                                                          |
|--------|------|----------------------------------------------------------------------|
| 0x0    | 0x34 | AP info from [ACU:GetCurrentAPInfo](ACU:GetCurrentAPInfo "wikilink") |
| 0x34   | 0x4  | SSID length?                                                         |
| 0x38   | 0x20 | SSID                                                                 |
| 0x58   | 0xA  | ApNum                                                                |
| 0x62   | 0x1  | ?                                                                    |
| 0x63   | 0x5  | ?                                                                    |
| 0x68   | 0x18 | UTF-8 ServiceName?                                                   |
| 0x80   | 0x20 | Network encryption key                                               |
| 0xA0   | 0x1  | ?                                                                    |
| 0xA1   | 0x1  | ?                                                                    |
| 0xA2   | 0x1  | ?                                                                    |
| 0xA3   | 0x1  | ?                                                                    |