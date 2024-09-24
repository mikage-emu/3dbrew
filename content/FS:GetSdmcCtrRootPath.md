# Request

| Index Word | Description                              |
|------------|------------------------------------------|
| 0          | Header code \[0x08480042\]               |
| 1          | Size of output buffer in wide-characters |
| 2          | (bytesize \<\< 4) \| 0xC                 |
| 3          | Output wchar buffer pointer              |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This retrieves the [/Nintendo 3DS/<ID0>/<ID1>](SD_Filesystem "wikilink")
path.