# Request

| Index Word | Description                           |
|------------|---------------------------------------|
| 0          | Header code \[0x040C0800\]            |
| 1-24       | [Mii Data](Mii#Mii_format "wikilink") |
| 25-30      | UTF-16 Mii name                       |
| 31         | u8 Profanity flag                     |
| 32         | u8 Character set                      |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This updates the Mii data on the friends list. Note: Mii Maker seems to
be leaking memory on the Mii name, so any data after the NULL
termination should be discarded.