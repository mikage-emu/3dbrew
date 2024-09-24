# Request

| Index Word | Description                           |
|------------|---------------------------------------|
| 0          | Header code \[0x004E0204\]            |
| 1          | File handle lower word                |
| 2          | File handle upper word                |
| 3          | Offset lower word                     |
| 4          | Offset upper word                     |
| 5          | Size of write buffer                  |
| 6          | Alignment size (always 0x00001000)    |
| 7          | Size of hashtable                     |
| 8          | Flush flags                           |
| 9          | (size of hashtable \<\< 8) \| 6       |
| 10         | Pointer to hashtable                  |
| 11         | (size of write buffer \<\< 8) \| 0x14 |
| 12         | Pointer to write buffer               |

# Response

| Index Word | Description  |
|------------|--------------|
| 0          | Header code  |
| 1          | Result code  |
| 2          | Size written |
| 3          | 4            |

The data written are stored in the write buffer. For each 0x1000-byte
block written, a SHA256 hash of the block is stored in the hashtable.

It is unknown how hashing behaves if the write offset/size are not
aligned to a 0x1000-byte boundary.