# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x08120000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This deletes the NAND [SecureInfo](Nandrw/sys/SecureInfo_A "wikilink")
file, then recreates it using the SecureInfo data stored in memory.