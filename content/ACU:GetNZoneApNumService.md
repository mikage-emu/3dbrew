+++
title = 'ACU:GetNZoneApNumService'
+++

# Request

| Index Word | Description                        |
|------------|------------------------------------|
| 0          | Header code \[0x00110042\]         |
| 1          | Size                               |
| 2          | Value 0x20 (processID header)      |
| 3          | ProcessID set by the ARM11 kernel. |

The following is located 0x100-bytes after the beginning of the above
command buffer:

| Index Word | Description                      |
|------------|----------------------------------|
| 0          | (Size\<\<14) \| 2                |
| 1          | Pointer to output info structure |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Output NZone Info Structure

| Offset | Size | Description        |
|--------|------|--------------------|
| 0x0    | 0xA  | ApNum              |
| 0xA    | 0x2  | Padding?           |
| 0xC    | 0x18 | UTF-8 ServiceName? |