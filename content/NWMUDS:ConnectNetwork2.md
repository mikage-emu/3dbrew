+++
title = 'NWMUDS:ConnectNetwork2'
+++

# Request

| Index Word | Description                                        |
|------------|----------------------------------------------------|
| 0          | Header code \[0x001E0084\]                         |
| 1          | u8 Connection type: 0x1 = Client, 0x2 = Spectator. |
| 2          | [Passphrase](NWM_Services "wikilink") buffer size  |
| 3          | (NetworkStructSize\<\<12) \| 0x402                 |
| 4          | Input network struct buffer ptr                    |
| 5          | (PassphraseSize\<\<12) \| 2                        |
| 6          | Input passphrase buffer ptr                        |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This connects to the specified network.

Before using this command official user-processes verify that the
passphrase_buf is not NULL, and that PassphraseSize is \>=8 and \<=0xFF.
On fail that user-process code returns 0xE10113FD for that. That
user-process code also checks the network attributes bitmask 0x1, see
[here](NWM_Services "wikilink").