# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00090042\] |
| 1          | Size                       |
| 2          | (Size \<\< 4) \| 0xA       |
| 3          | FIRM Parameters Pointer    |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

The size is clamped to 0x1000-bytes, then the input buffer is copied to
the [mapped](SVC#KernelSetState "wikilink") buffer for
[FIRM](FIRM "wikilink") launch parameters. When the size is less than
0x1000-bytes, then the remainder of the mapped buffer which was not
copied to is cleared.