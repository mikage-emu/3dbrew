+++
title = 'AMNet:BeginImportContent'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x080E0040\] |
| 1          | u16, Content Index         |

# Response

| Index Word | Description    |
|------------|----------------|
| 0          | Header code    |
| 1          | Result code    |
| 2          | 0x10           |
| 3          | Content Handle |

# Description

This is used to open a content, with the TMD content type encrypted
flag. This is normally used for content installation. The data written
to the opened file is the raw encrypted data from Nintendo's CDN
servers.