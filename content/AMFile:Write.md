+++
title = 'AMFile:Write'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x08030102\] |
| 1          | File offset lower word     |
| 2          | File offset upper word     |
| 3          | Size                       |
| 4          | Flush flags                |
| 5          | (Size\<\<4) \| 10          |
| 6          | Data ptr                   |

# Response

| Index Word | Description        |
|------------|--------------------|
| 0          | Header code        |
| 1          | Resultcode         |
| 2          | Total written data |
