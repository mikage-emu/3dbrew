+++
title = 'NFC:GetAppDataInitStruct'
+++

# Request

| Index Word | Description                                       |
|------------|---------------------------------------------------|
| 0          | Header code \[Starting with 9.3.0-X: 0x00190000\] |

# Response

| Index Word | Description              |
|------------|--------------------------|
| 0          | Header code              |
| 1          | Result code              |
| 2-16       | Output 0x3C-byte struct. |

# Description

This just returns a 0x3C-byte struct which was cleared to all-zeros.
This is only usable when [NFC:Initialize](NFC:Initialize "wikilink") was
used with type2.

The data starting at struct offset 0xC is the 0x30-byte struct used by
[NFC:InitializeWriteAppData](NFC:InitializeWriteAppData "wikilink"),
sent by the user-process.