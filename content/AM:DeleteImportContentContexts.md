# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x00120102\]                             |
| 1          | Import Content Context Count                           |
| 2          | [Media Type](Filesystem_services#MediaType "wikilink") |
| 3-4        | u64, Title ID                                          |
| 5          | ((Import Content Context Count \* 2) \<\< 4) \| 0xA    |
| 6          | Import Content Context Indices Input Pointer           |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Wraps
[AMPXI:DeleteImportContentContexts](AMPXI:DeleteImportContentContexts "wikilink").