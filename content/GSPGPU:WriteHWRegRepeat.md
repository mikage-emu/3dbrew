+++
title = 'GSPGPU:WriteHWRegRepeat'
+++

# Request

| Index Word | Description                                                             |
|------------|-------------------------------------------------------------------------|
| 0          | Header code \[0x00030082\]                                              |
| 1          | [GPU](GPU "wikilink") address based at 0x1EB00000, must be word-aligned |
| 2          | Size, must be \<=0x80 and word-aligned                                  |
| 3          | (Size\<\<14) \| 2                                                       |
| 4          | Data pointer                                                            |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This repeatedly writes the input data to the specified fixed GPU
register address. The GPU register offset must be \<0x420000.