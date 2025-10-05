+++
title = 'FRD Savegame'
+++

This page describes the contents of the [friends](Friend_Services "wikilink") sysmodule savegame.

Save data for the sysmodule has the following general structure:

`data`  
`├── `[`config`](FRD_Savegame#config "wikilink")  
`└── `<Local Account ID>  
`    ├── `[`account`](FRD_Savegame#account "wikilink")  
`    ├── `[`friendlist`](FRD_Savegame#friendlist "wikilink")  
`    └── `[`mydata`](FRD_Savegame#mydata "wikilink")

Despite being generally unused, the sysmodule supports the usage of multiple accounts.

Each account gets its own "Local Account ID", and a directory named after this ID. The directory contains all relevant account information.

## config

This file only contains the local account ID of the currently active account.

The friends sysmodule uses this file to determine which account to load by default.

| Offset | Size | Description                                |
|--------|------|--------------------------------------------|
| 0x00   | 4    | File magic "FPCF" (Friend Presence Config) |
| 0x04   | 4    | File magic number (0x20101021)             |
| 0x08   | 8    | Padding                                    |
| 0x10   | 4    | Current Local Account ID                   |

## account

This file stores various essential data related to the corresponding account.

| Offset | Size | Description |
|----|----|----|
| 0x00 | 4 | File magic "FPAC" (Friend Presence Account Config) |
| 0x04 | 4 | File magic number (0x20101021) |
| 0x08 | 8 | Padding |
| 0x10 | 4 | Local Account ID |
| 0x14 | 4 | PrincipalID |
| 0x18 | 8 | LocalFriendCode |
| 0x20 | (16 + 1) \* 2 | 16-character UTF-16 NEX Password (16 characters + NULL termination) |
| 0x42 | (8 + 1) \* 2 | 8-character UTF-16 PrincipalID HMAC (Used for logging into NASC server) (8 characters + NULL termination) |
| 0x54 | 1 | NASC Environment (0: Production, 1: Testing, 2: Development) |
| 0x55 | 1 | [Server type](Friend_Services#server_types "wikilink") letter value |
| 0x56 | 1 | [Server type](Friend_Services#server_types "wikilink") number value |
| 0x57 | 1 | Padding |

## mydata

Stores console-specific information related to the account.

| Offset | Size | Description |
|----|----|----|
| 0x00 | 4 | File magic "FPMD" (Friend Presence My Data/Device) |
| 0x04 | 4 | File magic number (0x20101021) |
| 0x08 | 8 | Padding |
| 0x10 | 4 | My NC Principal ID |
| 0x14 | 4 | MoveCount |
| 0x18 | 4 | [Change bit flag](FRD_Savegame#change_bit_flags "wikilink") |
| 0x1C | 3 | [Preferences](Friend_Services#preference "wikilink") |
| 0x1F | 1 | Padding |
| 0x20 | 0x10 | [GameKey](Friend_Services#gamekey "wikilink") of favorite title |
| 0x30 | (16 + 1) \* 2 | 16-Character UTF-16 personal message (comment) (16 characters + NULL termination) |
| 0x52 | 1 | First byte of the console's LocalFriendCodeSeed |
| 0x53 | 5 | Padding |
| 0x58 | 8 | [Profile](Friend_Services#profile "wikilink") |
| 0x60 | 8 | u64, LocalFriendCodeSeed |
| 0x68 | (12 + 1) \* 2 | 12-character UTF-16 MAC address (only the digits) (12 characters + NULL termination) |
| 0x82 | (15 + 1) \* 2 | 15-character UTF-16 console serial number without the checksum digit (15 characters + NULL termination) |
| 0xA2 | (10 + 1) \* 2 | 10-character UTF-16 Display name (10 characters + NULL termination) |
| 0xBB | 0x60 | [Mii data](Mii#cflstoredata "wikilink") |
| 0x11B | 5 | Padding |

### Change Bit Flags

| Value | Description                                             |
|-------|---------------------------------------------------------|
| 1     | [Game Key](Friend_Services#gamekey "wikilink") changed. |
| 2     | Game mode description changed.                          |
| 4     | Join availability flag changed.                         |
| 8     | Matchmake system type changed.                          |
| 16    | Join game ID changed.                                   |
| 32    | Join game mode changed.                                 |
| 64    | Owner \[PID\] changed.                                  |
| 128   | Join group ID changed.                                  |
| 256   | Application argument changed.                           |

## friendlist

Contains the friend list associated with the account.

### Header

| Offset | Size | Description |
|----|----|----|
| 0x00 | 4 | File magic "FPFL" (Friend Presence Friend List) |
| 0x04 | 4 | File magic number (0x20101021) |
| 0x08 | 8 | Padding |
| 0x10 | 100 \* 0x100 | [Friend entries](FRD_Savegame#friend_entry "wikilink") (maximum 100) |

### Friend entry

| Offset | Size | Description |
|----|----|----|
| 0x00 | 0x10 | [FriendKey](Friend_Services#friendkey "wikilink") of this friend |
| 0x10 | 0x4 | NC Principal ID of this friend |
| 0x14 | 1 | [Relationship](Friend_Services#relationship_types "wikilink") with this friend |
| 0x15 | 8 | [Profile](Friend_Services#profile "wikilink") of this friend |
| 0x1D | 3 | Padding |
| 0x20 | 0x10 | [GameKey](Friend_Services#gamekey "wikilink") of this friend's favorite title |
| 0x30 | (16 + 1) \* 2 | 16-character UTF-16 personal message (comment) of this friend (16 characters + NULL termination) |
| 0x52 | 0x6 | padding |
| 0x58 | 8 | NEX timestamp for the last time this friend updated their personal comment (message) |
| 0x60 | 8 | NEX timestamp for the last time this friend updated their Mii |
| 0x68 | 8 | NEX timestamp for the last time this friend was seen online |
| 0x70 | 0x60 | [Mii data](Mii#cflstoredata "wikilink") |
| 0xD0 | (10 + 1) \* 2 | 10-character UTF-16 Display name (10 characters + NULL termination) |
| 0xE6 | 1 | bool, profanity flag |
| 0xE7 | 1 | u8, [Mii character set](Mii#mii_format "wikilink") |
| 0xE8 | 8 | NEX timestamp for when this friend was added |
| 0xF0 | 8 | Appears to be identical to the timestamp at offset 0x58. |
| 0xF8 | 8 | Appears to be identical to the timestamp at offset 0x60. |
