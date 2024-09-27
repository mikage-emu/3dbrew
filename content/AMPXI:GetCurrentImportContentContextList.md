+++
title = 'AMPXI:GetCurrentImportContentContextList'
+++

# Request

| Index Word | Description                                         |
|------------|-----------------------------------------------------|
| 0          | Header code \[0x00260042\]                          |
| 1          | Import Content Context Count                        |
| 2          | ((Import Content Context Count \* 2) \<\< 8) \| 0x4 |
| 3          | Import Content Context Indices Output Pointer       |

# Response

| Index Word | Description                                   |
|------------|-----------------------------------------------|
| 0          | Header code                                   |
| 1          | Result code                                   |
| 2          | Number of Read Import Content Context Indices |
