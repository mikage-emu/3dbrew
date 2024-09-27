# Request

| Index Word | Description                                                             |
|------------|-------------------------------------------------------------------------|
| 0          | Header code \[0x00020084\]                                              |
| 1          | [GPU](GPU "wikilink") address based at 0x1EB00000, must be word-aligned |
| 2          | Size, must be \<=0x80 and word-aligned                                  |
| 3          | (DataSize\<\<14) \| 2                                                   |
| 4          | Data pointer                                                            |
| 5          | (MaskDataSize\<\<14) \| 0x402                                           |
| 6          | Mask data pointer                                                       |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

The GPU register offset must be \<0x420000. GPU register = (register &
~maskword) \| (data & maskword).