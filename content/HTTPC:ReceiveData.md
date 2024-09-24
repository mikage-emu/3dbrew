+++
title = 'HTTPC:ReceiveData'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000B0082\] |
| 1          | HTTP context handle        |
| 2          | Buffer size                |
| 3          | (OutSize\<\<4) \| 12       |
| 4          | Output data pointer        |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This is the same as
[HTTPC:ReceiveDataDelay](HTTPC:ReceiveDataDelay "wikilink"), without the
delay. This returns error 0xd8a0a066 if the context handle is wrong.
