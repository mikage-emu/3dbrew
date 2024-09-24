# Request

| Index Word | Description                      |
|------------|----------------------------------|
| 0          | Header code \[0x00320084\]       |
| 1          | Parameter Size (capped to 0x300) |
| 2          | HMAC Size (capped to 0x20)       |
| 3          | (Parameter Size \<\< 14) \| 2    |
| 4          | void\*, Parameter                |
| 5          | (HMAC Size \<\< 14) \| 0x802     |
| 6          | void\*, HMAC                     |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

The input buffers are handled the same way as
[<APT:StartApplication>](APT:StartApplication "wikilink"). This also
terminates the currently running application/applet.