+++
title = 'NWMINF:ConnectToAP'
+++

# Request

| Index Word | Description |
|----|----|
| 0 | Header code \[0x0008....\] |
| 1-8 | SSID |
| 9 | SSID length |
| 10-11 | 6-byte AP MAC address |
| 12 | AP channel |
| 13 | ? |
| 14 | Event handle. This is probably signaled once the system finishes connecting to the AP? |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Calls same code as [NWMINF:ConnectToEncryptedAP](NWMINF:ConnectToEncryptedAP "wikilink") but with an all-zero encryption struct.
