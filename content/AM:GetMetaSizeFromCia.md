# Request

| Index Word | Description                        |
|------------|------------------------------------|
| 0          | Header code \[0x04130002\]         |
| 1          | 0x0 (Send-handle translate header) |
| 2          | File Handle                        |

# Response

| Index Word | Description       |
|------------|-------------------|
| 0          | Header code       |
| 1          | Result code       |
| 2          | Meta Section Size |

# Description

This retrieves the size of the meta section of the specified
[CIA](CIA "wikilink").