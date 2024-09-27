+++
title = 'CAMU:SetReceiving'
+++

# Request

| Index Word | Description                                     |
|------------|-------------------------------------------------|
| 0          | Header code \[0x00070102\]                      |
| 1          | Destination Pointer                             |
| 2          | [Port](Camera_Services#port "wikilink")         |
| 3          | Image Size                                      |
| 4          | s16, Transfer Unit                              |
| 5          | 0x0                                             |
| 6          | Destination Process Handle (usually 0xFFFF8001) |

# Response

| Index Word | Description                  |
|------------|------------------------------|
| 0          | Header code                  |
| 1          | Result code                  |
| 2          | Copy handle descriptor (0x0) |
| 3          | Receive Event Handle         |
