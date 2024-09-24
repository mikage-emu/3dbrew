+++
title = 'APT:CheckNew3DS'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x01020000\] |

# Response

| Index Word | Description                           |
|------------|---------------------------------------|
| 0          | Header code                           |
| 1          | Result code                           |
| 2          | u8, Status (0 = Old 3DS, 1 = New 3DS) |

# Description

Wrapper for [PTMSYSM:CheckNew3DS](PTMSYSM:CheckNew3DS "wikilink").