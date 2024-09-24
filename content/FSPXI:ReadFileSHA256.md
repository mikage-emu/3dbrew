+++
title = 'FSPXI:ReadFileSHA256'
+++

# Request

| Index Word | Description                          |
|------------|--------------------------------------|
| 0          | Header code \[0x004D01C4\]           |
| 1          | File handle lower word               |
| 2          | File handle upper word               |
| 3          | Offset lower word                    |
| 4          | Offset upper word                    |
| 5          | Size of read buffer                  |
| 6          | Alignment size (always 0x00001000)   |
| 7          | Size of hashtable                    |
| 8          | (size of hashtable \<\< 8) \| 6      |
| 9          | Pointer to hashtable                 |
| 10         | (size of read buffer \<\< 8) \| 0x14 |
| 11         | Pointer to read buffer               |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
| 2          | Size read   |
| 3          | 4           |

The data read are stored in the read buffer. For each 0x1000-byte block
read, a SHA256 hash of the block is stored in the hashtable.

It is unknown how hashing behaves if the read offset/size are not
aligned to a 0x1000-byte boundary.