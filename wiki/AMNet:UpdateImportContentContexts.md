# Request

| Index Word | Description                                         |
|------------|-----------------------------------------------------|
| 0          | Header code \[0x08260042\]                          |
| 1          | Import Content Context Count                        |
| 2          | ((Import Content Context Count \* 2) \<\< 4) \| 0xA |
| 3          | Import Content Context Indices Input Pointer        |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Wraps
[AMPXI:UpdateImportContentContexts](AMPXI:UpdateImportContentContexts "wikilink").