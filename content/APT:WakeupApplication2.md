# Request

| Index Word | Description                    |
|------------|--------------------------------|
| 0          | Header code \[0x00570044\]     |
| 1          | Parameter Size (max is 0x1000) |
| 2          | 0x0                            |
| 3          | Handle Parameter               |
| 4          | (Parameter Size \<\< 14) \| 2  |
| 5          | void\*, Parameter              |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This is the same as
[<APT:WakeupApplication>](APT:WakeupApplication "wikilink"), except
parameters can be passed to the application in the wake up message.