+++
title = 'DLPSRVR:Initialize'
+++

# Request

| Index Word | Description                        |
|------------|------------------------------------|
| 0          | Header code \[0x00010183\]         |
| 1          | Sharedmem size.                    |
| 2          | u8 Max number of clients.          |
| 3          | Process Id                         |
| 4          | u8 Child index                     |
| 5          | Block buffer size? 0x40000         |
| 6          | Block buffer num? 0x2              |
| 7          | MoveHandleDescriptor for 2 handles |
| 8          | Shared mem handle                  |
| 9          | Event handle                       |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This initializes the DLP server. The DLP child to be used is selected
based on the process title ID and the child index given. The high title
ID must be "00040001" and the low title ID must be: low_title_id & 0xFF
== child_index