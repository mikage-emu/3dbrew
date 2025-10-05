+++
title = 'NWMINF:ConnectToEncryptedAP'
+++

# Request

| Index Word | Description |
|----|----|
| 0 | Header code \[0x00070742\] |
| 1-8 | SSID |
| 9 | SSID length |
| 10-11 | 6-byte AP MAC address |
| 12 | AP channel |
| 13-29 | 0x44-byte encryption structure |
| 30 | Value 0x0 |
| 31 | Event handle. This is probably signaled once the system finishes connecting to the AP? |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Encryption structure

| Offset | Size | Description                                   |
|--------|------|-----------------------------------------------|
| 0x0    | 0x1  | ?                                             |
| 0x1    | 0x1  | ?                                             |
| 0x2    | 0x1  | ?                                             |
| 0x3    | 0x1  | ?                                             |
| 0x4    | 0x20 | This is the WPA PSK / network encryption key. |
| 0x24   | 0x20 | Usually zero.                                 |
