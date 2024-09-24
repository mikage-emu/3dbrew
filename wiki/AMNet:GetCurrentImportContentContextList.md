# Request

| Index Word | Description                                         |
|------------|-----------------------------------------------------|
| 0          | Header code \[0x08140042\]                          |
| 1          | Import Content Context Count                        |
| 2          | ((Import Content Context Count \* 2) \<\< 4) \| 0xC |
| 3          | Import Content Context Indices Output Pointer       |

# Response

| Index Word | Description                                   |
|------------|-----------------------------------------------|
| 0          | Header code                                   |
| 1          | Result code                                   |
| 2          | Number of Read Import Content Context Indices |

# Description

Wraps
[AMPXI:GetCurrentImportContentContextList](AMPXI:GetCurrentImportContentContextList "wikilink").