# Request

| Index Word | Description                               |
|------------|-------------------------------------------|
| 0          | Header code \[0x001400C0\]                |
| 1          | u32 [BindNodeID](NWMUDS:Bind "wikilink"). |
| 2          | 4-byte aligned MaxOutBufSize \>\> 2       |
| 3          | MaxOutBufSize                             |

The following is located 0x100-bytes after the beginning of the above
command buffer:

| Index Word | Description                  |
|------------|------------------------------|
| 0          | (OutBufSize\<\<14) \| 2      |
| 1          | Pointer to the output buffer |

# Response

| Index Word | Description                  |
|------------|------------------------------|
| 0          | Header code                  |
| 1          | Result code                  |
| 2          | Actual data size             |
| 3          | u16, source NetworkNodeID.   |
| 4          | (OutBufSize\<\<14) \| 2      |
| 5          | Pointer to the output buffer |

# Description

This loads a previously received *individual* data frame from state,
while connected to the UDS network. This includes all frames received
from a node before the node disconnected. The input size must be \>=
frame_size, otherwise error 0xE10113E9 is returned.

The MaxOutBufSize_wordsize is clamped to 0x172(aka 0x5C8-bytes), but
this field isn't really used after that. Instead it just uses
MaxOutBufSize, without a size limit.