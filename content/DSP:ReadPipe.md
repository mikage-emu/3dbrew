+++
title = 'DSP:ReadPipe'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000E00C0\] |
| 1          | Channel                    |
| 2          | Peer                       |
| 3          | u16, Size                  |

0x100 byte after the Request header

| Index Word | Description           |
|------------|-----------------------|
| 0          | (Size \<\< 14) \| 0x2 |
| 1          | Buffer                |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# See Also

- [DSP:ReadPipeIfPossible](DSP:ReadPipeIfPossible "wikilink")