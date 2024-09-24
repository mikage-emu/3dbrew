# Request

| Index Word | Description                        |
|------------|------------------------------------|
| 0          | Header code \[0x04140044\]         |
| 1          | Size                               |
| 2          | 0x0 (Send-handle translate header) |
| 3          | File Handle                        |
| 4          | (Size \<\< 4) \| 0xC               |
| 5          | Output Buffer Pointer              |

# Response

| Index Word | Description       |
|------------|-------------------|
| 0          | Header code       |
| 1          | Result code       |
| 2          | Size of read data |
|            |                   |

# Description

This loads the meta section of the specified [CIA](CIA "wikilink").

This is used by the DLP-sysmodule for loading the 8-byte meta section of
the [CVer](CVer "wikilink") .cia, which contains a copy of the
version.bin.