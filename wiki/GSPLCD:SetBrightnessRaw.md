# Request

| Index Word | Description                        |
|------------|------------------------------------|
| 0          | Header code \[0x000A0080\]         |
| 1          | Screen index (top = 1, bottom = 2) |
| 2          | Brightness level (0x10 - 0xAC)     |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Sets the brightness of the given screen. The function will automatically
cap the brightness level between 0x10 and 0xAC, inclusive.