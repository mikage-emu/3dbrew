# Request

| Index Word | Description                                       |
|------------|---------------------------------------------------|
| 0          | Header code \[Starting with 9.3.0-X: 0x00090002\] |
| 1          | 0x20, PID translate-header for kernel.            |
| 2          | PID written by kernel.                            |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This writes the Amiibo data stored in memory to the actual Amiibo data
storage(which is normally the NFC data pages).

Before writing to NFC, the following [amiibosettings](Amiibo "wikilink")
are updated: last-write date and the write counter. The
titleID/programID field is also updated via the input processID, when a
certain NFC module state field is value 0x1.

This command can only used when
[NFC:LoadAmiiboData](NFC:LoadAmiiboData "wikilink") was previously
used([tagstate5](NFC:GetTagState "wikilink")).