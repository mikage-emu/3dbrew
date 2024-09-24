# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x040100C4\] |
| 1          | Action                     |
| 2          | Input Size                 |
| 3          | Output Size                |
| 4          | (inputSize \<\< 4) \| 0xA  |
| 5          | void\* Input               |
| 6          | (outputSize \<\< 4) \| 0xC |
| 7          | void\* Output              |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This allows performing extra actions on the filesystem.

# Action

| Value | Description | Input | Output |
|-------|-------------|-------|--------|
| 0     | ?           | ?     | ?      |