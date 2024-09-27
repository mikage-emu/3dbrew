+++
title = 'PMApp:LaunchTitle'
+++

# Request

| Index Word | Description                                                |
|------------|------------------------------------------------------------|
| 0          | Header code \[0x00010140\]                                 |
| 1-4        | [Program Info](Filesystem_services#programinfo "wikilink") |
| 5          | Process launch flags                                       |

# Response

| Index Word | Description                               |
|------------|-------------------------------------------|
| 0          | Header code                               |
| 1          | Result code                               |
| 2          | Process ID (set only if flag 0x1 not set) |

# Description

This launches the specified title.

This returns result code 0xC8A05801 if
[PMApp:PrepareForReboot](PMApp:PrepareForReboot "wikilink") has been
called, and 0xC8A05BF0 if the application flag is set and an application
is already running.

# Launch Flags

| Bit | Bit Mask | Description                                                                                                  |
|-----|----------|--------------------------------------------------------------------------------------------------------------|
| 0   | 0x1      | Normal application.                                                                                          |
| 1   | 0x2      | Load [exheader](NCCH/Extended_Header "wikilink") dependencies.                                               |
| 2   | 0x4      | On termination, publish [SRV notification](Services#notifications "wikilink") "0x110 + (value in bits 4-7)". |
| 3   | 0x8      | Queue execution until [RunQueuedProcess](PMDbg:RunQueuedProcess "wikilink") call.                            |
| 4-7 | 0xF0     | Variation of signal 0x110 to send if bit 2 (0x4) is set.                                                     |
| 16  | 0x10000  | Use update title if through [LaunchTitleUpdate](PMApp:LaunchTitleUpdate "wikilink"). Otherwise has no use.   |
