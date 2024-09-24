# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00060000\] |

# Response

| Index Word | Description                     |
|------------|---------------------------------|
| 0          | Header code \[0x00060042\]      |
| 1          | Result code                     |
| 2          | Copy Handle Header (0x04000000) |
| 3          | Event Handle                    |

# Description

Gets the event handle used to signal the [news
module](News_Services "wikilink") that a background system update is
ready to commit.