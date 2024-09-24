+++
title = 'FRDU:UpdateGameModeDescription'
+++

# Request

| Index Word | Description                                                               |
|------------|---------------------------------------------------------------------------|
| 0          | Header code \[0x001D0002\]                                                |
| 1          | (len\<\<14) \| 0x802                                                      |
| 2          | Pointer to input UTF-16 text buffer, buffer size is normally 0x100-bytes. |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This sets the "currently playing" text description displayed in the
friends-list(separate from the application title text). The specified
data seems to be sent in encrypted(?) UDP frame(s) to the friends
server.