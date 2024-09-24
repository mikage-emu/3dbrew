# Request

| Index Word | Description                        |
|------------|------------------------------------|
| 0          | Header code \[0x040C0002\]         |
| 1          | 0x0 (Send-handle translate header) |
| 2          | File Handle                        |

# Response

| Index Word | Description  |
|------------|--------------|
| 0          | Header code  |
| 1          | Result code  |
| 2          | Core Version |

# Description

This retrieves the core version from the specified
[CIA](CIA "wikilink")'s meta section.