# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000B0000\] |

# Response

| Index Word | Description                        |
|------------|------------------------------------|
| 0          | Header code \[0x000B0280\]         |
| 1          | Result code                        |
| 2-10       | Saved Hash String (NUL-Terminated) |

# Description

Gets the currently stored system update hash.

A certain internal NIM state flag must be non-zero, otherwise error
0xE0A0D3F8 is returned. This is the only time this command can return
non-zero.

This writes the SystemTitleHash already stored in memory to the command
response. This is initially from savedata. When doing SOAP request(s)
this data is updated with the latest data from the SOAP response, then
the data for this in savedata is updated.