+++
title = 'ACTA:UpdateMii'
+++

# Request

| Index Word | Description                                   |
|------------|-----------------------------------------------|
| 0          | Header code \[0x041207C0\]                    |
| 1          | u8 Account slot (0xFE to use current account) |
| 2-25       | [Mii Data](Mii#Mii_format "wikilink")         |
| 26-31      | UTF-16 Mii name                               |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This updates the NNID Mii data.