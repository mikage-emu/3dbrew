+++
title = 'ACU:GetAPSSIDList'
+++

# Request

| Index Word | Description                 |
|------------|-----------------------------|
| 0          | Header code \[0x003C0042\]  |
| 1          | Size                        |
| 2          | (Size\<\<4) \| 12           |
| 3          | Pointer to output structure |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Output Structure

| Offset | Size               | Description                                                           |
|--------|--------------------|-----------------------------------------------------------------------|
| 0x0    | 0x2                | Total AP entries                                                      |
| 0x2    | 0x2                | ?                                                                     |
| 0x4    | Totalentries\*0x24 | This is the AP entries: entry+0 = unknown, +4 = 0x20-byte SSID field. |

The APs from the wifi configuration is listed first, following those APs
is the [hotspot.conf](Nintendo_Zone "wikilink") APs.
