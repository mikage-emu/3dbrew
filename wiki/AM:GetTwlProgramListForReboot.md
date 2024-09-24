# Request

| Index Word | Description                        |
|------------|------------------------------------|
| 0          | Header code \[0x04110044\]         |
| 1          | Title Count                        |
| 2          | ((Title Count \* 8) \<\< 4) \| 0xC |
| 3          | Title IDs Output Pointer           |
| 4          | ((Title Count \* 4) \<\< 4) \| 0xC |
| 5          | Content IDs Output Pointer         |

# Response

| Index Word | Description            |
|------------|------------------------|
| 0          | Header code            |
| 1          | Result code            |
| 2          | Number of Read Entries |

# Description

Wraps
[AMPXI:GetTwlProgramListForReboot](AMPXI:GetTwlProgramListForReboot "wikilink").