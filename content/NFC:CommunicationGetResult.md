+++
title = 'NFC:CommunicationGetResult'
+++

# Request

| Index Word | Description                                       |
|------------|---------------------------------------------------|
| 0          | Header code \[Starting with 9.3.0-X: 0x00120000\] |

# Response

| Index Word | Description                     |
|------------|---------------------------------|
| 0          | Header code                     |
| 1          | Result code                     |
| 2          | Output NFC-adapter result-code. |

# Description

New3DS NFC module: This basically just writes u32 value 0x0 to
cmdreply\[2\]. Old3DS: copies an u32 from <somestatestruct>+0x30 to
cmdreply\[2\].

This returns the result-code for Old3DS NFC adapter communication.
User-processes only use this when the status value from
[NFC:CommunicationGetStatus](NFC:CommunicationGetStatus "wikilink")
indicates that an error occurred.