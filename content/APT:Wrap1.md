+++
title = 'APT:Wrap1'
+++

# Request

| Index Word | Description                 |
|------------|-----------------------------|
| 0          | Header code \[0x00520104\]  |
| 1          | Output Size                 |
| 2          | Input Size                  |
| 3          | Nonce Offset                |
| 4          | Nonce Size (capped to 12)   |
| 5          | (Input Size \<\< 4) \| 0xA  |
| 6          | void\*, Input               |
| 7          | (Output Size \<\< 4) \| 0xC |
| 8          | void\*, Output              |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Similar to [<APT:Wrap>](APT:Wrap "wikilink"), but using a software
AES-CCM implementation with a different key stored in the NS module.
This is probably to avoid [a bug in the hardware
implementation](AES_Registers#CCM_mode_pitfall "wikilink").
