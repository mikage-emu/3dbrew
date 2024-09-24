+++
title = 'NFC:Initialize'
+++

# Request

| Index Word | Description                                                                                                                        |
|------------|------------------------------------------------------------------------------------------------------------------------------------|
| 0          | Header code \[Starting with 9.3.0-X: 0x00010040\]                                                                                  |
| 1          | u8 type. Can be either value 0x1 or 0x2. Or 0x3 as of [10.0.0-X](10.0.0-27 "wikilink") for using new command(s) from that version. |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

The two input values appear have the same result, except in addition NFC
module will call some more functions with value 2. NFC module will
eventually execute the savedata writing code referenced in the below
savedata section with this command.

Type3 allows the user-process to use raw NFC tag commands. NFC-module
*itself* will not send any NFC tag commands with type3 without using the
service [command](NFC:SendTagCommand "wikilink") for it.