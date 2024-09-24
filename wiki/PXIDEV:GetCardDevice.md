# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000F0000\] |

# Response

| Index Word | Description                                    |
|------------|------------------------------------------------|
| 0          | Header code                                    |
| 1          | Result code                                    |
| 2          | [Card Device](NCSD#Partition_Flags "wikilink") |

# Description

This reads the 0x200-byte [NCSD](NCSD "wikilink") header from the game
card. Then the value at 0x18B within the [NCSD
header](NCSD#NCSD_header "wikilink") (PartitionFlags\[3\]) is copied to
cmdreply\[2\].