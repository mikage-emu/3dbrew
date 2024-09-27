# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x080B0082\] |
| 1          | Size                       |
| 2          | u8 flag                    |
| 3          | (Size\<\<4) \| 12          |
| 4          | Output data pointer        |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

The input size should be 0x10-bytes, this is not checked by Cfg module.
When the input flag is non-zero, this uses
[PS:GetLocalFriendCodeSeed](Process_Services "wikilink"). The output
data is written to LocalFriendCodeSeed+0x108(in memory), and the 8-bytes
at +0x100 are cleared.

The 0x10-bytes at LocalFriendCodeSeed+0x100 are then copied to the
output buffer.