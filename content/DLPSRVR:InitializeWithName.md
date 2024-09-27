+++
title = 'DLPSRVR:InitializeWithName'
+++

# Request

| Index Word | Description                        |
|------------|------------------------------------|
| 0          | Header code \[0x000F0303\]         |
| 1          | Sharedmem size.                    |
| 2          | u8 Max number of clients.          |
| 3          | Process Id                         |
| 4          | u8 Child index                     |
| 5          | Block buffer size? 0x40000         |
| 6          | Block buffer num? 0x2              |
| 7-12       | UTF-16 username                    |
| 13         | MoveHandleDescriptor for 2 handles |
| 14         | Shared mem handle                  |
| 15         | Event handle                       |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Same as [Initialize](DLPSRVR:Initialize "wikilink"), but also specifies
a 0x18-byte long username to be used
